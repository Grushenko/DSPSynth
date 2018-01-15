# Generated by the VisualDSP++ IDDE

# Note:  Any changes made to this Makefile will be lost the next time the
# matching project file is loaded into the IDDE.  If you wish to preserve
# changes, rename this file and run it externally to the IDDE.

# The syntax of this Makefile is such that GNU Make v3.77 or higher is
# required.

# The current working directory should be the directory in which this
# Makefile resides.

# Supported targets:
#     Block Based TalkThru_Debug
#     Block Based TalkThru_Debug_clean

# Define this variable if you wish to run this Makefile on a host
# other than the host that created it and VisualDSP++ may be installed
# in a different directory.

ADI_DSP=C:\Program Files (x86)\Analog Devices\VisualDSP 5.1.2


# $VDSP is a gmake-friendly version of ADI_DIR

empty:=
space:= $(empty) $(empty)
VDSP_INTERMEDIATE=$(subst \,/,$(ADI_DSP))
VDSP=$(subst $(space),\$(space),$(VDSP_INTERMEDIATE))

RM=cmd /C del /F /Q

#
# Begin "Block Based TalkThru_Debug" configuration
#

ifeq ($(MAKECMDGOALS),Block Based TalkThru_Debug)

Block\ Based\ TalkThru_Debug : ./Debug/Block\ Based\ TalkThru.dxe 

./Debug/blockProcess.doj :blockProcess.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h 
	@echo ".\blockProcess.c"
	$(VDSP)/cc21k.exe -c .\blockProcess.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\blockProcess.doj -MM

./Debug/init1835viaSPI.doj :init1835viaSPI.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h ad1835.h 
	@echo ".\init1835viaSPI.c"
	$(VDSP)/cc21k.exe -c .\init1835viaSPI.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\init1835viaSPI.doj -MM

./Debug/initDAI.doj :initDAI.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h $(VDSP)/213xx/include/SRU.h $(VDSP)/213xx/include/sru21364.h $(VDSP)/213xx/include/sru21363.h 
	@echo ".\initDAI.c"
	$(VDSP)/cc21k.exe -c .\initDAI.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\initDAI.doj -MM

./Debug/initPLL.doj :initPLL.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h 
	@echo ".\initPLL.c"
	$(VDSP)/cc21k.exe -c .\initPLL.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\initPLL.doj -MM

./Debug/initSPORT.doj :initSPORT.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h 
	@echo ".\initSPORT.c"
	$(VDSP)/cc21k.exe -c .\initSPORT.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\initSPORT.doj -MM

./Debug/irqprocess.doj :irqprocess.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h ad1835.h 
	@echo ".\irqprocess.c"
	$(VDSP)/cc21k.exe -c .\irqprocess.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\irqprocess.doj -MM

./Debug/main.doj :main.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h 
	@echo ".\main.c"
	$(VDSP)/cc21k.exe -c .\main.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\main.doj -MM

./Debug/midi2spi.doj :midi2spi.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h 
	@echo ".\midi2spi.c"
	$(VDSP)/cc21k.exe -c .\midi2spi.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\midi2spi.doj -MM

./Debug/SPORTisr.doj :SPORTisr.c tt.h $(VDSP)/213xx/include/cdef21364.h $(VDSP)/213xx/include/Cdef21363.h $(VDSP)/213xx/include/def21364.h $(VDSP)/213xx/include/def21363.h $(VDSP)/213xx/include/signal.h $(VDSP)/213xx/include/stdio.h $(VDSP)/213xx/include/stdio_21xxx.h 
	@echo ".\SPORTisr.c"
	$(VDSP)/cc21k.exe -c .\SPORTisr.c -file-attr ProjectName=Block\ Based\ TalkThru -g -no-multiline -double-size-32 -warn-protos -si-revision 0.5 -proc ADSP-21364 -o .\Debug\SPORTisr.doj -MM

./Debug/Block\ Based\ TalkThru.dxe :$(VDSP)/213xx/ldf/ADSP-21364.LDF $(VDSP)/213xx/lib/2136x_rev_0.0/364_hdr.doj ./Debug/blockProcess.doj ./Debug/init1835viaSPI.doj ./Debug/initDAI.doj ./Debug/initPLL.doj ./Debug/initSPORT.doj ./Debug/irqprocess.doj ./Debug/main.doj ./Debug/midi2spi.doj ./Debug/SPORTisr.doj $(VDSP)/213xx/lib/2136x_rev_0.0/libc36x.dlb $(VDSP)/213xx/lib/2136x_rev_0.0/libio.dlb $(VDSP)/213xx/lib/2136x_rev_0.0/libdsp36x.dlb $(VDSP)/213xx/lib/2136x_rev_0.0/libcpp.dlb 
	@echo "Linking..."
	$(VDSP)/cc21k.exe .\Debug\blockProcess.doj .\Debug\init1835viaSPI.doj .\Debug\initDAI.doj .\Debug\initPLL.doj .\Debug\initSPORT.doj .\Debug\irqprocess.doj .\Debug\main.doj .\Debug\midi2spi.doj .\Debug\SPORTisr.doj -L .\Debug -add-debug-libpaths -flags-link -od,.\Debug -o .\Debug\Block\ Based\ TalkThru.dxe -proc ADSP-21364 -si-revision 0.5 -MM

endif

ifeq ($(MAKECMDGOALS),Block Based TalkThru_Debug_clean)

Block\ Based\ TalkThru_Debug_clean:
	-$(RM) ".\Debug\blockProcess.doj"
	-$(RM) ".\Debug\init1835viaSPI.doj"
	-$(RM) ".\Debug\initDAI.doj"
	-$(RM) ".\Debug\initPLL.doj"
	-$(RM) ".\Debug\initSPORT.doj"
	-$(RM) ".\Debug\irqprocess.doj"
	-$(RM) ".\Debug\main.doj"
	-$(RM) ".\Debug\midi2spi.doj"
	-$(RM) ".\Debug\SPORTisr.doj"
	-$(RM) ".\Debug\Block Based TalkThru.dxe"
	-$(RM) ".\Debug\*.ipa"
	-$(RM) ".\Debug\*.opa"
	-$(RM) ".\Debug\*.ti"
	-$(RM) ".\Debug\*.pgi"
	-$(RM) ".\*.rbld"

endif


