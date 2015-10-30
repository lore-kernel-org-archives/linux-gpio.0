From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Fri, 30 Oct 2015 10:22:28 +0100
Message-ID: <CACRpkdaRgtrnPVcTTX5VU0F1-NSPU1kWgt7v-tQ0-Ta9upXgmQ@mail.gmail.com>
References: <20151019165914.GA22867@sophia>
	<CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
	<20151027142343.GI1548@lahna.fi.intel.com>
	<CACRpkdbs8US2m1+hEmXbJ9JJT15-iRHnO2L4bk5qeNRgb2vbKg@mail.gmail.com>
	<20151027165134.GK1548@lahna.fi.intel.com>
	<CACRpkdZBnmE2F7i2PYuxvO4cpYsGnrcGr0HMKg9WAPVMGnDBTw@mail.gmail.com>
	<20151029082259.GD1548@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151029082259.GD1548@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2015 at 9:22 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> x86 has I/O space regardless of ISA or PCI (even though most probably it
> also has ISA and PCI). Looking at the drivers in question they seem to
> be x86 drivers so maybe "depends on X86"?

Yeah I see it now... x86 had these instructions since ages, I'm
stupid for not thinking about it the right way :/

OK I will try to create some meny and shovel it under
depends on X86.

Yours,
Linus Walleij
