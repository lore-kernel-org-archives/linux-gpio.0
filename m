From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Wed, 17 Aug 2016 15:42:58 +0200
Message-ID: <CALUN=q+LAfTf_=V4tXy3_h48K2BLtNOjxK4=AKRTtdjfW8970g@mail.gmail.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
 <20150601092348.GK1747@lahna.fi.intel.com> <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
 <20150602141520.GE4057@lahna.fi.intel.com> <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
 <20160817081344.GM30827@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160817081344.GM30827@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 17, 2016 at 10:13 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Aug 16, 2016 at 06:12:40PM +0200, Anisse Astier wrote:
>> Hi Mika,
>>
>> Did you find a way to fix this issue ? I'm seeing a similar problem on a
>> laptop where this masks the interrupt used for ACPI events (brightness,
>> lid, battery).
>
> I seem to have forgotten this completely :-/
>
> Can you send me output of /sys/kernel/debug/pinctrl/INT33FF:*/pins for
> that particular EC pin?
>
> In addition if you apply this patch do you see that ACPI events start
> working?

>From what I've seen it's in the north range, I don't know which pin in
particular it is yet.

If the interrupts aren't masked for the north community, ACPI events
start working.


# cat /sys/kernel/debug/pinctrl/INT33FF\:01/pins
registered pins: 59
pin 0 (GPIO_DFX_0) GPIO ctrl0 0x00118102 ctrl1 0x05c00000
pin 1 (GPIO_DFX_3) GPIO ctrl0 0x2c018100 ctrl1 0x05c00000
pin 2 (GPIO_DFX_7) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
pin 3 (GPIO_DFX_1) GPIO ctrl0 0x18118100 ctrl1 0x05c00000
pin 4 (GPIO_DFX_5) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
pin 5 (GPIO_DFX_4) GPIO ctrl0 0x00118102 ctrl1 0x05c00000
pin 6 (GPIO_DFX_8) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
pin 7 (GPIO_DFX_2) GPIO ctrl0 0x00118100 ctrl1 0x05c00000
pin 8 (GPIO_DFX_6) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
pin 15 (GPIO_SUS0) GPIO ctrl0 0x3c018201 ctrl1 0x05c00001
pin 16 (SEC_GPIO_SUS10) GPIO ctrl0 0x00118100 ctrl1 0x05c00000
pin 17 (GPIO_SUS3) GPIO ctrl0 0x4c118100 ctrl1 0x05c00000
pin 18 (GPIO_SUS7) GPIO ctrl0 0xfc918201 ctrl1 0x05c00001
pin 19 (GPIO_SUS1) mode 6 ctrl0 0x00160301 ctrl1 0x05c00000
pin 20 (GPIO_SUS5) mode 1 ctrl0 0x00910200 ctrl1 0x05c00000
pin 21 (SEC_GPIO_SUS11) GPIO ctrl0 0x5c118100 ctrl1 0x05c00000
pin 22 (GPIO_SUS4) mode 6 ctrl0 0x00960301 ctrl1 0x05c00000
pin 23 (SEC_GPIO_SUS8) mode 1 ctrl0 0x00910300 ctrl1 0x05c00000
pin 24 (GPIO_SUS2) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
pin 25 (GPIO_SUS6) GPIO ctrl0 0xec918201 ctrl1 0x05c00001
pin 26 (CX_PREQ_B) mode 1 ctrl0 0x00a10301 ctrl1 0x05c00000
pin 27 (SEC_GPIO_SUS9) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
pin 30 (TRST_B) mode 1 ctrl0 0x00a10300 ctrl1 0x05c00000
pin 31 (TCK) mode 1 ctrl0 0x00210300 ctrl1 0x05c00000
pin 32 (PROCHOT_B) mode 1 ctrl0 0x00010301 ctrl1 0x05c00060
pin 33 (SVIDO_DATA) mode 0 ctrl0 0x00000300 ctrl1 0x05c00020
pin 34 (TMS) mode 1 ctrl0 0x00a10301 ctrl1 0x05c00000
pin 35 (CX_PRDY_B_2) mode 1 ctrl0 0x00a10301 ctrl1 0x05c00000
pin 36 (TDO_2) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 37 (CX_PRDY_B) mode 1 ctrl0 0x00a10301 ctrl1 0x05c00000
pin 38 (SVIDO_ALERT_B) mode 1 ctrl0 0x00010301 ctrl1 0x05c00040
pin 39 (TDO) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 40 (SVIDO_CLK) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 41 (TDI) mode 1 ctrl0 0x00a10301 ctrl1 0x05c00000
pin 45 (GP_CAMERASB_05) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 46 (GP_CAMERASB_02) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 47 (GP_CAMERASB_08) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 48 (GP_CAMERASB_00) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 49 (GP_CAMERASB_06) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 50 (GP_CAMERASB_10) GPIO ctrl0 0x00118100 ctrl1 0x05c00000
pin 51 (GP_CAMERASB_03) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 52 (GP_CAMERASB_09) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 53 (GP_CAMERASB_01) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 54 (GP_CAMERASB_07) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 55 (GP_CAMERASB_11) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 56 (GP_CAMERASB_04) GPIO ctrl0 0x00118100 ctrl1 0x05c00020
pin 60 (PANEL0_BKLTEN) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 61 (HV_DDI0_HPD) mode 1 ctrl0 0x03110301 ctrl1 0x05c00020
pin 62 (HV_DDI2_DDC_SDA) mode 3 ctrl0 0x00930301 ctrl1 0x05c00000
pin 63 (PANEL1_BKLTCTL) GPIO ctrl0 0x00018102 ctrl1 0x05c00000
pin 64 (HV_DDI1_HPD) mode 1 ctrl0 0x03010300 ctrl1 0x05c00020
pin 65 (PANEL0_BKLTCTL) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 66 (HV_DDI0_DDC_SDA) mode 1 ctrl0 0x00910301 ctrl1 0x05c00000
pin 67 (HV_DDI2_DDC_SCL) mode 3 ctrl0 0x00930301 ctrl1 0x05c00000
pin 68 (HV_DDI2_HPD) mode 1 ctrl0 0x03110300 ctrl1 0x05c00020
pin 69 (PANEL1_VDDEN) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 70 (PANEL1_BKLTEN) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
pin 71 (HV_DDI0_DDC_SCL) mode 1 ctrl0 0x00910301 ctrl1 0x05c00000
pin 72 (PANEL0_VDDEN) mode 1 ctrl0 0x00010300 ctrl1 0x05c00000
