From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 11:41:38 -0400
Message-ID: <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35571 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbcCVPl7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 11:41:59 -0400
Received: by mail-ob0-f178.google.com with SMTP id fp4so204279280obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 08:41:58 -0700 (PDT)
In-Reply-To: <20160322152218.GA2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Mar 22, 2016 at 11:22 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I think this is a known issue.
>
> Please disable dw_dmac from your .config (or blacklist the module):
>
>   CONFIG_DW_DMAC_CORE=n
>   CONFIG_DW_DMAC=n
>
> You can also enable pinctrl-cherryview.c.

Thanks for the suggestion. Did not complete boot however, got a
slightly different call trace, but still no go. As that trace crossed
_prepare_cpus I tried adding nosmp, but we still crash in
acpi_init->acpi_scan_init->acpi_bus_scan->acpi_bus_attach

Any other suggestion? lspci normal and verbose follow...


m

00:00.0 Host bridge [0600]: Intel Corporation Device [8086:2280] (rev 21)

00:02.0 VGA compatible controller [0300]: Intel Corporation Device
[8086:22b1] (rev 21)

00:0b.0 Signal processing controller [1180]: Intel Corporation Device
[8086:22dc] (rev 21)

00:10.0 SD Host controller [0805]: Intel Corporation Device [8086:2294] (rev 21)

00:14.0 USB controller [0c03]: Intel Corporation Device [8086:22b5] (rev 21)

00:18.0 DMA controller [0801]: Intel Corporation Device [8086:22c0] (rev 21)

00:18.1 Serial bus controller [0c80]: Intel Corporation Device
[8086:22c1] (rev 21)

00:1a.0 Encryption controller [1080]: Intel Corporation Device
[8086:2298] (rev 21)

00:1b.0 Audio device [0403]: Intel Corporation Device [8086:2284] (rev 21)

00:1c.0 PCI bridge [0604]: Intel Corporation Device [8086:22c8] (rev 21)

00:1c.2 PCI bridge [0604]: Intel Corporation Device [8086:22cc] (rev 21)

00:1e.0 DMA controller [0801]: Intel Corporation Device [8086:2286] (rev 21)

00:1e.4 Communication controller [0780]: Intel Corporation Device
[8086:228c] (rev 21)

00:1f.0 ISA bridge [0601]: Intel Corporation Device [8086:229c] (rev 21)

00:1f.3 SMBus [0c05]: Intel Corporation Device [8086:2292] (rev 21)

02:00.0 Network controller [0280]: Intel Corporation Wireless 3160
[8086:08b3] (rev 83)


---

00:00.0 Host bridge: Intel Corporation Device 2280 (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0

Kernel driver in use: iosf_mbi_pci

Kernel modules: iosf_mbi


00:02.0 VGA compatible controller: Intel Corporation Device 22b1 (rev
21) (prog-if 00 [VGA controller])

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0

Interrupt: pin A routed to IRQ 19

Region 0: Memory at 90000000 (64-bit, non-prefetchable) [size=16M]

Region 2: Memory at 80000000 (64-bit, prefetchable) [size=256M]

Region 4: I/O ports at 1000 [size=64]

Expansion ROM at <unassigned> [disabled]

Capabilities: [d0] Power Management version 2

Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-

Address: fee0100c  Data: 4171

Capabilities: [b0] Vendor Specific Information: Len=07 <?>

Kernel driver in use: i915

Kernel modules: i915


00:0b.0 Signal processing controller: Intel Corporation Device 22dc (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Interrupt: pin A routed to IRQ 10

Region 0: Memory at 9131c000 (64-bit, non-prefetchable) [size=4K]

Capabilities: [40] MSI: Enable- Count=1/1 Maskable- 64bit-

Address: 00000000  Data: 0000

Capabilities: [50] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel modules: processor_thermal_device


00:10.0 SD Host controller: Intel Corporation Device 2294 (rev 21) (prog-if 01)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 7

Region 0: Memory at 91321000 (32-bit, non-prefetchable) [size=4K]

Capabilities: [80] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold-)

Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: sdhci-pci

Kernel modules: sdhci_pci


00:14.0 USB controller: Intel Corporation Device 22b5 (rev 21)
(prog-if 30 [XHCI])

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0

Interrupt: pin A routed to IRQ 18

Region 0: Memory at 91300000 (64-bit, non-prefetchable) [size=64K]

Capabilities: [70] Power Management version 2

Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0-,D1-,D2-,D3hot+,D3cold+)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+

Address: 00000000fee0100c  Data: 4161

Kernel driver in use: xhci_hcd


00:18.0 DMA controller: Intel Corporation Device 22c0 (rev 21)
(prog-if 02 [EISA DMA])

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 11

Region 0: Memory at 91318000 (32-bit, non-prefetchable) [size=16K]

Capabilities: [80] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: dw_dmac_pci

Kernel modules: dw_dmac_pci


00:18.1 Serial bus controller [0c80]: Intel Corporation Device 22c1 (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 11

Region 0: Memory at 9131f000 (32-bit, non-prefetchable) [size=4K]

Capabilities: [80] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: i2c-designware-pci

Kernel modules: i2c_designware_pci


00:1a.0 Encryption controller: Intel Corporation Device 2298 (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 20

Region 0: Memory at 91200000 (32-bit, non-prefetchable) [size=1M]

Region 1: Memory at 91100000 (32-bit, non-prefetchable) [size=1M]

Capabilities: [80] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold-)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit-

Address: fee0100c  Data: 4181

Kernel driver in use: mei_txe

Kernel modules: mei_txe


00:1b.0 Audio device: Intel Corporation Device 2284 (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 21

Region 0: Memory at 91310000 (64-bit, non-prefetchable) [size=16K]

Capabilities: [50] Power Management version 2

Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+

Address: 00000000fee0100c  Data: 4191

Kernel driver in use: snd_hda_intel

Kernel modules: snd_hda_intel


00:1c.0 PCI bridge: Intel Corporation Device 22c8 (rev 21) (prog-if 00
[Normal decode])

Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin ? routed to IRQ 16

Bus: primary=00, secondary=01, subordinate=01, sec-latency=0

I/O behind bridge: 00002000-00002fff

Memory behind bridge: 91400000-915fffff

Prefetchable memory behind bridge: 0000000100000000-00000001001fffff

Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-

BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-

PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00

DevCap: MaxPayload 128 bytes, PhantFunc 0

ExtTag- RBE+

DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-

RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

MaxPayload 128 bytes, MaxReadReq 128 bytes

DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-

LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s
<1us, L1 <4us

ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-

LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk-

ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-

SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+

Slot #0, PowerLimit 0.000W; Interlock- NoCompl+

SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq+ LinkChg+

Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-

Changed: MRL- PresDet- LinkState-

RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-

RootCap: CRSVisible-

RootSta: PME ReqID 0000, PMEStatus- PMEPending-

DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, OBFF Via
WAKE# ARIFwd-

DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF
Disabled ARIFwd-

LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-

Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

Compliance De-emphasis: -6dB

LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-,
EqualizationPhase1-

EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

Address: fee0100c  Data: 4141

Capabilities: [90] Subsystem: Acer Incorporated [ALI] Device 106c

Capabilities: [a0] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: pcieport

Kernel modules: shpchp


00:1c.2 PCI bridge: Intel Corporation Device 22cc (rev 21) (prog-if 00
[Normal decode])

Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin C routed to IRQ 17

Bus: primary=00, secondary=02, subordinate=02, sec-latency=0

I/O behind bridge: 0000f000-00000fff

Memory behind bridge: 91000000-910fffff

Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff

Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-

BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-

PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00

DevCap: MaxPayload 128 bytes, PhantFunc 0

ExtTag- RBE+

DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-

RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

MaxPayload 128 bytes, MaxReadReq 128 bytes

DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-

LnkCap: Port #3, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency
L0s <512ns, L1 <16us

ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-

LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+
BWMgmt+ ABWMgmt-

SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-

Slot #2, PowerLimit 10.000W; Interlock- NoCompl+

SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-

Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-

Changed: MRL- PresDet- LinkState+

RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-

RootCap: CRSVisible-

RootSta: PME ReqID 0000, PMEStatus- PMEPending-

DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, OBFF Not
Supported ARIFwd-

DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF
Disabled ARIFwd-

LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-

Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

Compliance De-emphasis: -6dB

LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-,
EqualizationPhase1-

EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

Address: fee0100c  Data: 4151

Capabilities: [90] Subsystem: Acer Incorporated [ALI] Device 106c

Capabilities: [a0] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: pcieport

Kernel modules: shpchp


00:1e.0 DMA controller: Intel Corporation Device 2286 (rev 21)
(prog-if 02 [EISA DMA])

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 10

Region 0: Memory at 91314000 (32-bit, non-prefetchable) [size=16K]

Capabilities: [80] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: dw_dmac_pci

Kernel modules: dw_dmac_pci


00:1e.4 Communication controller: Intel Corporation Device 228c (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 10

Region 0: Memory at 9131e000 (32-bit, non-prefetchable) [size=4K]

Capabilities: [80] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: serial


00:1f.0 ISA bridge: Intel Corporation Device 229c (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0

Capabilities: [e0] Vendor Specific Information: Len=0c <?>

Kernel driver in use: lpc_ich

Kernel modules: lpc_ich


00:1f.3 SMBus: Intel Corporation Device 2292 (rev 21)

Subsystem: Acer Incorporated [ALI] Device 106c

Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-

Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Interrupt: pin B routed to IRQ 10

Region 0: Memory at 9131d000 (32-bit, non-prefetchable) [size=32]

Region 4: I/O ports at 1040 [size=32]

Capabilities: [50] Power Management version 3

Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

Kernel driver in use: i801_smbus

Kernel modules: i2c_i801


02:00.0 Network controller: Intel Corporation Wireless 3160 (rev 83)

Subsystem: Intel Corporation Dual Band Wireless AC 3160

Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+

Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

Latency: 0, Cache Line Size: 64 bytes

Interrupt: pin A routed to IRQ 22

Region 0: Memory at 91000000 (64-bit, non-prefetchable) [size=8K]

Capabilities: [c8] Power Management version 3

Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+

Address: 00000000fee0100c  Data: 41a1

Capabilities: [40] Express (v2) Endpoint, MSI 00

DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 unlimited

ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+

DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-

RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-

MaxPayload 128 bytes, MaxReadReq 128 bytes

DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-

LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency
L0s <4us, L1 <32us

ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-

LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-

LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-

DevCap2: Completion Timeout: Range B, TimeoutDis+, LTR+, OBFF Via WAKE#

DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis-, LTR+, OBFF Disabled

LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-

Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

Compliance De-emphasis: -6dB

LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-,
EqualizationPhase1-

EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

Kernel driver in use: iwlwifi

Kernel modules: iwlwifi



-- 
 martin.langhoff@gmail.com
 -  ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 ~ http://docs.moodle.org/en/User:Martin_Langhoff
