From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 6/6] pinctrl: st: Display pin's function
 when printing pinctrl debug information
Date: Wed, 18 Mar 2015 16:54:25 +0000
Message-ID: <20150318165425.GS3318@x1>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org>
 <1426675899-19882-7-git-send-email-lee.jones@linaro.org>
 <5509A93A.5080202@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5509A93A.5080202@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, kernel@stlinux.com
List-Id: linux-gpio@vger.kernel.org

On Wed, 18 Mar 2015, Maxime Coquelin wrote:

> Hi Lee,
>=20
> On 03/18/2015 11:51 AM, Lee Jones wrote:
> >Great for easily determining which mode a pin is operating in.
> >This patch was particularly helpful when debugging a recent GPIO/
> >Pinctrl disparity issue.
> >
> >Before:
> >     $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
> >       pin 33 (PIO4[1]):[OE:0,PU:0,OD:0]
> >              [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:=
0]
> >
> >After [GPIO]:
> >     $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
> >       pin 33 (PIO4[1]):[OE:0,PU:0,OD:0] GPIO
> >              [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:=
0]
> >
> >After [Alt]:
> >     $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
> >       pin 33 (PIO4[1]):[OE:0,PU:0,OD:0] Alt Fn 2
> >              [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:=
0]
> >
> >Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >---
> >  drivers/pinctrl/pinctrl-st.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> A couple of comments below.
> Once fixed, you can add my:
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
>=20
>=20
>=20
> >
> >diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-=
st.c
> >index 1cda40e..d5b2ffa 100644
> >--- a/drivers/pinctrl/pinctrl-st.c
> >+++ b/drivers/pinctrl/pinctrl-st.c
> >@@ -1058,18 +1058,28 @@ static void st_pinconf_dbg_show(struct pinct=
rl_dev *pctldev,
> >  {
> >  	struct st_pio_control *pc;
> >  	unsigned long config;
> >+	unsigned int function;
> >  	int offset =3D st_gpio_pin(pin_id);
> >+	char f[64];
> 64 bytes is way too big here

Ah yes, this is legacy from when the message was much larger.

Initially, it was "WARN: Pin in GPIO mode -- this status is invalid"

But this incarnation is much nicer I thought.

Good spot.  Will fix.

> >  	mutex_unlock(&pctldev->mutex);
> >  	pc =3D st_get_pio_control(pctldev, pin_id);
> >  	st_pinconf_get(pctldev, pin_id, &config);
> >  	mutex_lock(&pctldev->mutex);
> >-	seq_printf(s, "[OE:%ld,PU:%ld,OD:%ld]\n"
> >+
> >+	function =3D st_pctl_get_pin_function(pc, offset);
> >+	if (function)
> >+		sprintf(f, "Alt Fn %d", function);
> Please use snprintf.

Of course.  Will fix.

> >+	else
> >+		sprintf(f, "GPIO");
> >+
> >+	seq_printf(s, "[OE:%d,PU:%ld,OD:%ld]\t%s\n"
> >  		"\t\t[retime:%ld,invclk:%ld,clknotdat:%ld,"
> >  		"de:%ld,rt-clk:%ld,rt-delay:%ld]",
> >  		!st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset),
> >  		ST_PINCONF_UNPACK_PU(config),
> >  		ST_PINCONF_UNPACK_OD(config),
> >+		f,
> >  		ST_PINCONF_UNPACK_RT(config),
> >  		ST_PINCONF_UNPACK_RT_INVERTCLK(config),
> >  		ST_PINCONF_UNPACK_RT_CLKNOTDATA(config),
>=20
> Thanks,
> Maxime

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
