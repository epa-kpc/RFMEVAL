       program mats2ncf

!----------------------------------------------------------------------
!   MATS2NCF 1.0
!----------------------------------------------------------------------

c *** Variable declarations
      implicit none
      
      include 'PARMS3.EXT'
      include 'IODECL3.EXT'
      include 'FDESC3.EXT'

      REAL    :: XCELL, YCELL,rlon0,rlat0,tlat1,tlat2
      REAL    :: rrfs,days,ppb,o3ifga,ifo3,ibo3,o3ibga
      REAL    :: lat,long,dx,xorg,yorg,junk,ga, sumref,sumcontrol

      real bpm25dv,fpm25dv,bblank,sumbenefit,sumemis,bpt,
     &      bsoil,bec,bnh4,bocm,bso4,bno3,bwater,bsalt,fblank,
     &      fsoil,fec,fnh4,focm,fso4,fno3,fwater,fsalt,
     &      rsoil,rec,rnh4,rocm,rso4,rno3,rsalt,rwater

      INTEGER :: NCOLS, NROWS
      integer    c, r, k, n
      integer :: i,j,ii,jj,ijcell,refcell,date,nxc,nyc,nzc

      REAL, ALLOCATABLE :: exc(:,:),base(:,:,:),alt(:,:,:),benefit(:,:)

      CHARACTER(LEN=16) :: progname, spec
      CHARACTER(LEN=16) :: met, outfile
      CHARACTER(LEN=80) :: MESG
      CHARACTER(LEN=50) :: ename
      CHARACTER(LEN=300) :: ifile,ipath
 
      CHARACTER(LEN=16), ALLOCATABLE :: vnames(:)

      INTEGER :: istatus         

      INTEGER :: TRIMLEN
      real       envreal,vsladj

      EXTERNAL TRIMLEN, envreal

c *** Initialize variables
      progname = 'MATS2NCF'
c      outfile  = 'OUTFILE'

c--------Read standard input for grid and filename information

      read(*,'(10x,a)') ifile
      read(ifile,*) ename
      write(*,*)'Run description:',ename

      read(*,'(10x,a)') ifile
      read(ifile,*) vsladj
      write(*,*) 'VSL to adjust EASIUR $8.8M 2010 USD VSL:',vsladj

      read(*,'(10x,a)') ifile
      read(ifile,*) spec
      write(*,*)'Pollutant species:',spec

      read(*,'(10x,a)') ifile
      read(ifile,*) nxc,nyc
      nzc = 1
      write(*,'(a,t20,3i10)') 'Grid size',nxc,nyc,nzc

      read(*,'(10x,a)') ifile
      read(ifile,*) dx,xorg,yorg
      write(*,'(a,t20,3f10.0)') 'Grid spacing and origin',dx,xorg,yorg
      read(*,'(10x,a)') ifile
      read(ifile,*) rlon0,rlat0,tlat1,tlat2
      write(*,'(a,t20,4f10.0)') 'Projection:',rlon0,rlat0,tlat1,tlat2

      read(*,'(10x,a)') outfile
c      open(9,file=outfile,form='unformatted')
      write(*,*) 'New netCDF/IOAPI file: ',outfile

        read(*,'(10x,a)') ifile
        open(10,file=ifile,status='old')
        write(*,*) 'Opened EASIUR doller per ton file: ', ifile

        read(*,'(10x,a)') ifile
        open(11,file=ifile,status='old')
        write(*,*) 'Opened emission reference scenario file: ', ifile

        read(*,'(10x,a)') ifile
        open(12,file=ifile,status='old')
        write(*,*) 'Opened emission alternative scenario file: ', ifile

      read(*,'(10x,a)') ifile
      open(20,file=ifile,form='FORMATTED',status='unknown')
      write(*,*) 'Opened total benefits output file: ', ifile

c-----Allocate variables

      allocate (exc(nxc,nyc))
      allocate (base(nxc,nyc,9))
      allocate (alt(nxc,nyc,9))
      allocate (benefit(nxc,nyc))

c-----Read input file

        do n = 1,1  !read over header lines
          read(10,*)
          read(11,*)
          read(12,*)
        enddo

 798    continue

        read(10,*,end=799)j,(exc(i,j),i=1,nxc)

        goto 798
 799    continue


       do ii = 1, nxc*nyc
        read(11,*)j,i,(base(i,j,k),k=1,9)
        read(12,*)j,i,(alt(i,j,k),k=1,9)
       enddo


c-----Calculations

       if(spec.eq.'NH3') then
        k = 1
       elseif(spec.eq.'NOX') then 
        k = 2
       elseif(spec.eq.'SO2') then
        k = 3
       elseif(spec.eq.'PM25') then
        k = 5
       elseif(spec.eq.'VOC_A') then
        k = 8
       elseif(spec.eq.'PEC') then
        k = 6
       elseif(spec.eq.'POC') then
        k = 7
       else
        write(*,*)'No species match!!'
       endif

       sumbenefit = 0.0
       sumemis = 0.0
       sumref = 0.0
       sumcontrol = 0.0

       do i = 1, nxc
        do j = 1, nyc
         benefit(i,j) = exc(i,j)*(base(i,j,k)-alt(i,j,k))*(vsladj/8.8)
         sumbenefit = sumbenefit + benefit(i,j)
         sumemis = sumemis + (alt(i,j,k)-base(i,j,k))
         sumref = sumref + base(i,j,k)
         sumcontrol = sumcontrol + alt(i,j,k)
        enddo
       enddo

       if(sumemis.ne.0) then
       bpt = sumbenefit/sumemis
       else
       bpt = -9.
       endif

       write(*,*)'!Benefit,emission,bpt=',ename,sumbenefit,sumref,sumcontrol,sumemis,bpt
       write(20,200) ename,sumbenefit,sumref,sumcontrol,sumemis,bpt
 200   format(a50,',',f20.2,',',f20.2,',',f20.2,',',f20.2,',',f20.2)

c-----Populate grid ioapi grid variables

      FTYPE3D = 1

      NCOLS3D = nxc
      NROWS3D = nyc
      XCELL3D = dx*1000.
      YCELL3D = dx*1000.
      NLAYS3D = 1
      NTHIK3D = 1
      XORIG3D = xorg*1000.
      YORIG3D = yorg*1000.

      SDATE3D = 0
      STIME3D = 0
      MXREC3D = 1
      TSTEP3D = 10000
      write(*,*) MXREC3D, SDATE3D, STIME3D

      GDTYP3D = 2
      P_ALP3D = tlat1
      P_BET3D = tlat2
      P_GAM3D = rlon0
      XCENT3D = rlon0
      YCENT3D = rlat0
 

c ----------------------------- Write output file -------------------------%

      NVARS3D = 4
      
      VNAME3D(1) = 'BENEFIT'
      UNITS3D(1) = 'dollars'
      VTYPE3D(1) = M3REAL
      VDESC3D(1) = 'Monetized health benefit'

      VNAME3D(2) = 'EASIUR'
      UNITS3D(2) = 'dollar/ton'
      VTYPE3D(2) = M3REAL
      VDESC3D(2) = 'EASIUR dollar/ton values'

      VNAME3D(3) = 'BASE'
      UNITS3D(3) = 'tons'
      VTYPE3D(3) = M3REAL
      VDESC3D(3) = 'Baseline emissions scenario'

      VNAME3D(4) = 'ALT'
      UNITS3D(4) = 'tons'
      VTYPE3D(4) = M3REAL
      VDESC3D(4) = 'Alternative emissions scenario'

 


      if ( .not. open3( OUTFILE, FSUNKN3, progname ) ) THEN
          MESG = 'Could not open file "' //
     &     outfile( 1: TRIMLEN(OUTFILE))
     &     // '" for output'
c           CALL M3EXIT( progname, 0, 0, MESG, 2 )
      end if

      if ( .not.
     &        write3(OUTFILE,'BENEFIT',0,0,benefit(1,1))
     &        ) then
              mesg = 'Error writing '//'BENEFIT'//'from file '//
     &          outfile( 1: TRIMLEN( outfile ) )
              call m3exit( progname, 0, 0, MESG, 2 )
      end if

      if ( .not.
     &        write3(OUTFILE,'EASIUR',0,0,exc(1,1))
     &        ) then
              mesg = 'Error writing '//'EASIUR'//'from file '//
     &          outfile( 1: TRIMLEN( outfile ) )
              call m3exit( progname, 0, 0, MESG, 2 )
      end if

      if ( .not.
     &        write3(OUTFILE,'BASE',0,0,base(1,1,k))
     &        ) then
              mesg = 'Error writing '//'BASE'//'from file '//
     &          outfile( 1: TRIMLEN( outfile ) )
              call m3exit( progname, 0, 0, MESG, 2 )
      end if

      if ( .not.
     &        write3(OUTFILE,'ALT',0,0,alt(1,1,k))
     &        ) then
              mesg = 'Error writing '//'ALT'//'from file '//
     &          outfile( 1: TRIMLEN( outfile ) )
              call m3exit( progname, 0, 0, MESG, 2 )
      end if





      END
