From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH v3 bus+gpio 3/5] bus: moxtet: Add sysfs documentation
Date: Fri, 1 Mar 2019 16:15:10 +0100
Message-ID: <20190301161510.20b15183@nic.cz>
References: <20190301035852.26780-1-marek.behun@nic.cz>
        <20190301035852.26780-4-marek.behun@nic.cz>
        <CACRpkdam_CYGtph16McpQQ_WwohpZr+Rzi1B=re4UrGxXmSEqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdam_CYGtph16McpQQ_WwohpZr+Rzi1B=re4UrGxXmSEqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, 1 Mar 2019 15:34:26 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> > +What:          /sys/bus/moxtet/devices/moxtet-<name>.<addr>/output_val=
ue
> > +Date:          March 2019
> > +KernelVersion: 5.2
> > +Contact:       Marek Beh=C3=BAn <marek.behun@nic.cz>
> > +Description:   (RW) Read last written value or write value to the
> > module on
> > +               this Moxtet address. Format: %x =20
>=20
> What is the usecase for these?
>=20
> If this is for debugging it should be in debugfs rather than in sysfs.
>=20
> If it is here for random userspace drivers, we need some good
> explanation as to why they can't just be kernel drivers.

Hmm, it was for debugging purposes but the ability to write there is
not needed anymore... Shall I make it read/only? Or completely remove
it?

Marek
