From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: icelake: Fix the resource number for community-4/5
Date: Tue, 25 Sep 2018 00:05:01 +0300
Message-ID: <CAHp75VdDndQi9nj+hAR6wkFrgkf52QyQ+0iCsBFiJs1PS45iWQ@mail.gmail.com>
References: <20180913223143.12664-1-rajatja@google.com> <CAHp75VcVkp6i_4oNVJvzde13MwaRQge91mvZF2aXgneZC9nzWg@mail.gmail.com>
 <CACK8Z6FhJhhfgk1zPMv5M0oRwz=o75YOKFmU+4Wx-X9-prPnKA@mail.gmail.com>
 <CACK8Z6GeZ+2uRsRDPfdd=i+WrdQwQgEBvEyDxQuKLygXqPp4dw@mail.gmail.com>
 <CACK8Z6FLPVSJpPuAXZsqHV2rY2zy3L-Fvd=QPn=+Ynp3aHyhaQ@mail.gmail.com>
 <20180924135935.GP15943@smile.fi.intel.com> <70D28D5DAE32E9429B09AA8B7C84AC472C0000CB@BGSMSX106.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70D28D5DAE32E9429B09AA8B7C84AC472C0000CB@BGSMSX106.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: subrata.banik@intel.com
Cc: Rajat Jain <rajatja@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajat Jain <rajatxjain@gmail.com>, aamir.bohra@intel.com
List-Id: linux-gpio@vger.kernel.org

Please do not top post in the open source mailing lists.

On Mon, Sep 24, 2018 at 5:50 PM Banik, Subrata <subrata.banik@intel.com> wr=
ote:

> You are right that this ASL code is not same with Intel reference BIOS co=
de because BIOS sources are different between what you are looking vs what =
Chrome OS is using. In Coreboot BIOS, we are more relying on EDS spec and a=
s COM 3 is dedicated for CPU GPIO hence we are mapping, 0/1/2/4/5 (whatever=
 present in EDS vol 1.1)

But how would it possible to make interoperability work if there are
*different* firmwares for the *same* ACPI HID?
ACPI table is a part of protocol by which firmware sends data to the
software. If one breaks this protocol they must use another ACPI HID
for that kind of device.

> We have ensured that PCR ID and offsets are correct in ASL code for respe=
ctive community, I don't think anything else really matter from BIOS unless=
 you tell me, that you are having any required that your drive code will on=
ly probe for 4 COMM for LP and 5 for ICL-H?

See above.
So, I do not see any bug in the driver, but in firmware. In this case
FW may not use INT3455 HID.
This is my understanding, if you would like more details, ask BIOS and
ACPI teams.

> First of all, this is pre-production chip, so, I don't think there is a b=
ug in the driver (yet) discovered.
>
> Looking to the above ASL code I may conclude that is definitely is *not* =
from our reference BIOS.
> I have checked two versions of it and found that in both we have the foll=
owing mapping:
> for LP variant: there are only 4 communities are exported for H variant: =
there are only 5 communities are exported
>
> So, I guess the problem is in ASL code you provided. It simple should not=
 export that community at all.
>
> In case you need to do so, there are ways:
>  - contact Intel and ask for a change in reference BIOS
>  - acquire another ACPI ID for the case, or, perhaps use special constant=
s like
>    _HRV for that purpose (also need to contact Intel while doing that)

--=20
With Best Regards,
Andy Shevchenko
