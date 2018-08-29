From: Srikanth Korangala Hari <srikanth.h@samsung.com>
Subject: RE: [PATCH 1/1] Preventive patch in the pin control subsystem to
 handle NULL check.
Date: Wed, 29 Aug 2018 15:55:43 +0530
Message-ID: <20180829102543epcms5p2070c1c13edc239aa3f776f53b584c27a@epcms5p2>
References: <1535359139-6264-1-git-send-email-srikanth.h@samsung.com>
        <CGME20180827083916epcas1p43a3fc8570269411de215254ce0ae4b37@epcms5p2>
Reply-To: srikanth.h@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535359139-6264-1-git-send-email-srikanth.h@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Srikanth Korangala Hari <srikanth.h@samsung.com>
List-Id: linux-gpio@vger.kernel.org

> If=C2=A0the=C2=A0pin=C2=A0descriptor=C2=A0requested=C2=A0for=C2=A0the=C2=
=A0physical=C2=A0pin=C2=A0fails=C2=A0then=C2=A0the=0D=0A>=20descriptor=C2=
=A0is=C2=A0dereferenced=C2=A0without=C2=A0checking=C2=A0for=C2=A0its=C2=A0v=
alidity=C2=A0which=0D=0A>=20may=C2=A0lead=C2=A0to=C2=A0crash,=C2=A0hence=C2=
=A0added=C2=A0preventive=C2=A0code=C2=A0to=C2=A0check=C2=A0for=C2=A0NULL=0D=
=0A>=20and=C2=A0accordingly=C2=A0dereference.=0D=0A=C2=A0=0D=0A>=20Signed-o=
ff-by:=C2=A0Srikanth=C2=A0K=C2=A0H=C2=A0<srikanth.h=40samsung.com>=0D=0A>=
=20---=0D=0A>=C2=A0drivers/pinctrl/pinconf.c=C2=A0=7C=C2=A05=C2=A0+++--=0D=
=0A>=C2=A01=C2=A0file=C2=A0changed,=C2=A03=C2=A0insertions(+),=C2=A02=C2=A0=
deletions(-)=0D=0A=C2=A0=0D=0A>=20diff=C2=A0--git=C2=A0a/drivers/pinctrl/pi=
nconf.c=C2=A0b/drivers/pinctrl/pinconf.c=0D=0A>=20index=C2=A0d3fe143..576d0=
8d=C2=A0100644=0D=0A>=20---=C2=A0a/drivers/pinctrl/pinconf.c=0D=0A>=20+++=
=C2=A0b/drivers/pinctrl/pinconf.c=0D=0A>=20=40=40=C2=A0-269,8=C2=A0+269,9=
=C2=A0=40=40=C2=A0void=C2=A0pinconf_show_setting(struct=C2=A0seq_file=C2=A0=
*s,=0D=0A>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case=C2=A0P=
IN_MAP_TYPE_CONFIGS_PIN:=0D=0A>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0desc=C2=A0=3D=
=C2=A0pin_desc_get(setting->pctldev,=0D=0A>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0setting->data.configs.group_or_pi=
n);=0D=0A>=20-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s,=C2=A0=22pin=C2=A0%s=C2=A0=
(%d)=22,=C2=A0desc->name,=0D=0A>=20-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0setting->data.configs.group=
_or_pin);=0D=0A>=20+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(desc)=0D=0A>=20+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s=
,=C2=A0=22pin=C2=A0%s=C2=A0(%d)=22,=C2=A0desc->name,=0D=0A>=20+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0setting->data.configs.group=
_or_pin);=0D=0A>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;=0D=0A>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case=C2=A0PIN_MAP_TYPE_CONFIGS_GROUP=
:=0D=0A>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s,=C2=A0=22group=C2=A0%s=C2=
=A0(%d)=22,=0D=0A=0D=0ADear=20Maintainer's,=0D=0A=0D=0APlease=20confirm=20m=
e=20whether=20the=20above=20patch=20is=20considered=20for=20merging=20onto=
=20mainline=20?=0D=0A=0D=0AThanks,=0D=0ASrikanth=0D=0A=C2=A0=0D=0A=C2=A0
