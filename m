From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 27 Oct 2015 16:43:26 +0200
Message-ID: <20151027144326.GJ1548@lahna.fi.intel.com>
References: <20151019165914.GA22867@sophia>
 <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
 <20151027142343.GI1548@lahna.fi.intel.com>
 <20151027144037.GE4665@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151027144037.GE4665@kw.sim.vm.gnt>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2015 at 03:40:38PM +0100, Simon Guinot wrote:
> Should this driver not be moved under the "MFD GPIO expanders" menu ?

Maybe. It is still part of the PCH (Platform Controller Hub) as far as I
can tell so I would not call it a GPIO expander either ;-)
