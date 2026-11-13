Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532571;
	b=JVgyxDY86wNDMVE/yUDKq7EZGJUnZNxIVAVcIhXL+QyzV1jAjLNxaOONwpnBV5kI6hWo
	 KiXSMdlwFUhx7FZChvkTtmm0bXIuMBk/UjW/uNjqb84OxmchMjV2oMRQ8ObNxRU9bv4qq
	 +YnAFsHajw6StZ2fY4NkFpIJgQccGXniqTuh4MUJPJ3F1oACWQ4hKT3whUx7IqQxG5F74
	 sH9E5jWmv6sMlH+bHgKy08EZkQIzjF5scj1waz6U+VaMn5wfXyjokUWqDs5buHq9wQMvn
	 gcn8cdDdAQmfMy5iGFbob9Sgz1WmRXROIX3wGn9oJ5BD5a88iGzUByar0iEvx7iKS+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532571;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Date:Message-Id:Cc:
	 X-Lms-Return-Path:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:To:Subject:From:Mime-Version;
	bh=EuJesQLZQcUL7RHGlbQVMGLxz6hVm1h8tgff4wrd2C8=;
	b=Moc840iDbwGHg02CQpxF7NdIjoO2ZixMKdi6Qef3yWunhwi/FrKs0GhGw6rhJI4FOJet
	 VDQQXf2OfZwO6xnmyaMAfhEo6yCWL40iZ1tUD6/FMMwGXXwzVYtv6TI5bQCwbBxwnWVj6
	 WTEYAF6UN8nxSZYwIBeUgGf2k9P4KqZErt+g1G/VMlG8KESPVwxQuXB6cZhOOqsmibFLn
	 4JVb8M5UFGDpMG5Oold9boKpBCEiIhQVfrAc/lkYpxiMiUbFg+X1fBnVYmk8WDRhnac0e
	 QG3ogbBbCvUCv4ZLibHqlZ2M/DA1Ikuk4lWKBSO751U3cDOMyOgCh7EWgay4dn+XOHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.76
Received: from out28-76.mail.aliyun.com (out28-76.mail.aliyun.com [115.124.28.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656A9606A31C;
	Fri, 13 Nov 2026 01:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07437093|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0364211-0.000647065-0.962932;FP=10195514563781422546|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.k0uSnOv_1794532557;
Received: from localhost(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k0uSnOv_1794532557 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 09:15:58 +0800
Date: Fri, 13 Nov 2026 09:15:54 +0800
Message-Id: <e457d7c64cc913174affb10b272225cc3cbe88a3.47db7345.49f4.4282.8c3a.7d02c37fbf53@feishu.cn>
Cc: <linusw@kernel.org>, <florian.fainelli@broadcom.com>, 
	<rjui@broadcom.com>, <sbranden@broadcom.com>, 
	<bcm-kernel-feedback-list@broadcom.com>, <daniel@dragonzap.com>, 
	<iivanov@suse.de>, <andrea.porta@suse.com>, <phil@raspberrypi.com>, 
	<linux-gpio@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Jonathan Bell" <jonathan@raspberrypi.com>
X-Lms-Return-Path: <lba+16af664cb+a9c232+lists.infradead.org+wangxiaolei01@kaihong.com>
In-Reply-To: <avWuED_RGlEdGH-9@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com> <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
	<avWuED_RGlEdGH-9@apocalypse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: "Andrea della Porta" <andrea.porta@suse.com>
Subject: Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
From: =?utf-8?q?=E7=8E=8B=E5=AD=9D=E9=9B=B7?= <wangxiaolei01@kaihong.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Hi Andrea,
Thanks for the review,

> From: "Andrea della Porta"<andrea.porta@suse.com>
> Date:=C2=A0 Thu, Nov 12, 2026, 20:12
> Subject:=C2=A0 Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bo=
unds access in fsel_get()
> To: "Wang Xiaolei"<wangxiaolei01@kaihong.com>
> Cc: <linusw@kernel.org>, <florian.fainelli@broadcom.com>, <rjui@broadcom.=
com>, <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>, <da=
niel@dragonzap.com>, <iivanov@suse.de>, <andrea.porta@suse.com>, <phil@rasp=
berrypi.com>, <linux-gpio@vger.kernel.org>, <linux-rpi-kernel@lists.infrade=
ad.org>, <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.=
org>, "Jonathan Bell"<jonathan@raspberrypi.com>
> Hi Wang,
>=C2=A0
> On 07:06 Fri 06 Nov =C2=A0 =C2=A0 , Wang Xiaolei wrote:
> > brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
> > register and uses it directly as an index into
> > pc->pin_funcs[pin].funcs[]:
> >=C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 fsel =3D (val >> BIT_TO_SHIFT(bit)) & pc->p=
in_funcs[pin].func_mask;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D pc->pin_funcs[pin].funcs[fsel];
> >=C2=A0
> > That is not how the register field is encoded. The setter,
> > brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
> > funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
> > always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based functio=
n
> > number, while funcs[] is a 0-based array of eight entries.
> >=C2=A0
> > Every readback is consequently shifted by one slot, and a field value o=
f
> > 8 -- which the setter accepts, being the eighth and last alternate
> > function -- indexes funcs[8], one element past the end of the array.
> >=C2=A0
> > This is reachable from userspace without supplying any invalid input:
> >=C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 # echo "gpio45 alt8" > .../pinmux-select
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cat .../pins
> >=C2=A0
> > The write is an ordinary mux request that fsel_set() accepts; the read
> > that follows goes through pinctrl_pins_show() ->
> > brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
> > Raspberry Pi 5:
> >=C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG: KASAN: global-out-of-bounds in brcmstb=
_pctl_pin_dbg_show
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Read of size 1 at addr ffffa07c577ab2e8 by =
task cat/839
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 The buggy address belongs to the variable:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__compound_literal.62+0x8/0x40
> >=C2=A0
> > A field value of 0 has the same root cause in a milder form: it is
> > reported as funcs[0] instead of GPIO. The mux itself is programmed
> > correctly in both cases, so this affects the debugfs readback and KASAN
> > rather than the hardware configuration.
> >=C2=A0
> > Handle 0 and out-of-range values explicitly, and index funcs[] with
> > fsel - 1, so that the getter uses the same numbering as the setter and
> > the index can no longer go past funcs[n_funcs - 1]. The existing
> > fallback for func__ placeholder entries is kept:
> >=C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fsel)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return pc->func=
_gpio;
> >=C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fsel > pc->pin_funcs[pin].n_funcs) {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_warn(pc->de=
v,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0"invalid fsel %d for pin %u\n", fsel, pin);
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return pc->func=
_gpio;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> >=C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 func =3D pc->pin_funcs[pin].funcs[fsel - 1]=
;
>=C2=A0
> Non-blocking nit-pick: I think that pasting the code in the comment is
> too verbose, especially when the same code consists in the entire patch
> body here below. A succint explanation by words would be more than enough=
.

You're right that the commit message is too verbose with the code pasted in=
.
In V2 I'll drop the snippet and describe the numbering difference in words =
instead

>=C2=A0
> >=C2=A0
> > Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
> > "gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
> > the splat above. After the fix the same sequence reports
> > "function spi_m" with no warning and no splat, and a register field
> > value of 0 reports "gpio". The register is restored to 0 afterwards.
>=C2=A0
> Since you're at it, would you mind fixing the SGPIO AON related OOB acces=
s too?
> Please take a look at bcm2712_[cd]0_aon_gpio_pin_regs struct: they both h=
ave
> a bunch of AON_SGPIO_REGS macro describing pins at the end of the struct.=
 That
> macro puts them at [(n) + 32] in the struct so there's a hole between 'no=
rmal'
> gpios and SGPIO ones.
> Accessing bcm2712_[cd]0_aon_gpio_pin_funcs struct via this +32 offset as =
the
> 'pin' index in pc->pin_funcs[pin].funcs[] will result in OOB access. KASA=
N should
> report that if you 'cat pins' in aon pin controller.
>=C2=A0
> One way would be to refactor the code in order to avoid this hole, but I
> won't pretend this.
> The other way is just add the missing SGPIO entries in bcm2712_[cd]0_aon_=
gpio_pin_funcs
> (mind the +32 offset, a new macro is probably needed).
> You can find the functions for SGPIO pins declared in downstream driver, =
see file
> drivers/pinctrl/bcm/pinctrl-bcm2712.c from rpi-6.12.y branch (later branc=
hes
> already have the upstream driver which is missing the SGPIO functions ent=
irely).
> I've posted here the relevant data copied from downstream for your conven=
ience,
> please rearrange accordingly:
>=C2=A0
> static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m=
0, vc_i2c0, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m=
0, vc_i2c0, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m=
1, vc_i2c4, ctl_hdmi_5v, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m=
1, vc_i2c4, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi=
_5v, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _,=
 _, _),
> };
>=C2=A0
> static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m=
0, vc_i2c0, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m=
0, vc_i2c0, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m=
1, vc_i2c0, ctl_hdmi_5v, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m=
1, vc_i2c0, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi=
_5v, _, _, _, _),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _,=
 _, _),
> };
>=C2=A0
> In case you don't want to fix this, you will still have a Reviewed-by fro=
m me,
> and I'll take care of uploading the fix in a subsequent patch.

I have identified the issue and am preparing to submit a report.=C2=A0
Thank you for reminding me; I will include it in version 2.


+ =C2=A0 =C2=A0 =C2=A0 BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc=
_m0, vc_i2c0, _, _, _, _),
+ =C2=A0 =C2=A0 =C2=A0 BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc=
_m0, vc_i2c0, _, _, _, _),
+ =C2=A0 =C2=A0 =C2=A0 BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc=
_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
+ =C2=A0 =C2=A0 =C2=A0 BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc=
_m1, vc_i2c4, _, _, _, _),
+ =C2=A0 =C2=A0 =C2=A0 BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hd=
mi_5v, _, _, _, _),
+ =C2=A0 =C2=A0 =C2=A0 BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, =
_, _, _),
=C2=A0};

Thanks
Xiaolei

>=C2=A0
> Many thanks,
> Andrea
>=C2=A0
> >=C2=A0
> > Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller drive=
r")
> > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > Cc: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
> > ---
> > =C2=A0drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
> > =C2=A01 file changed, 10 insertions(+), 1 deletion(-)
> >=C2=A0
> > diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bc=
m/pinctrl-brcmstb.c
> > index f46b27155c3c..2b942ca7196b 100644
> > --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> > +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> > @@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct =
brcmstb_pinctrl *pc,
> > =C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl(pc->base + BIT_TO_REG(b=
it));
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsel =3D (val >> BIT_TO_SHIFT(bit)) &=
 pc->pin_funcs[pin].func_mask;
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0func =3D pc->pin_funcs[pin].funcs[fsel];
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fsel)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pc->fun=
c_gpio;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fsel > pc->pin_funcs[pin].n_funcs) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(pc->d=
ev, "invalid fsel %d for pin %u\n", fsel, pin);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pc->fun=
c_gpio;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0func =3D pc->pin_funcs[pin].funcs[fsel - 1=
];
> > =C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (func >=3D pc->func_count)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func =3D =
fsel;
> > --=C2=A0
> > 2.34.1
> >
>=C2=A0
