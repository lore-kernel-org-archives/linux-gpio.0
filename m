From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Intel-gfx] [PATCH] mfd: intel_soc_pmic_core: Terminate panel
 control GPIO lookup table correctly
Date: Mon, 9 May 2016 08:17:29 +0100
Message-ID: <20160509071729.GA1444@dell>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
 <CACRpkdasFcEAzDtHGU+unrsstyX+o1Ft=HAh22Esm5Z3KZ=2ug@mail.gmail.com>
 <20160502081938.GG14148@phenom.ffwll.local>
 <20160504073217.GB1503@dell.home>
 <20160509065703.GL27098@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38629 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbcEIHRT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2016 03:17:19 -0400
Received: by mail-wm0-f47.google.com with SMTP id g17so169635631wme.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 May 2016 00:17:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160509065703.GL27098@phenom.ffwll.local>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Shobhit Kumar <shobhit.kumar@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, stable <stable@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On Mon, 09 May 2016, Daniel Vetter wrote:

> On Wed, May 04, 2016 at 08:32:17AM +0100, Lee Jones wrote:
> > On Mon, 02 May 2016, Daniel Vetter wrote:
> >=20
> > > On Fri, Apr 29, 2016 at 11:31:44AM +0200, Linus Walleij wrote:
> > > > On Fri, Apr 22, 2016 at 9:38 PM,  <ville.syrjala@linux.intel.co=
m> wrote:
> > > >=20
> > > > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > >
> > > > > GPIO lookup tables are supposed to be zero terminated. Let's =
do that
> > > > > and avoid accidentally walking off the end.
> > > > >
> > > > > Cc: Shobhit Kumar <shobhit.kumar@intel.com>
> > > > > Cc: Samuel Ortiz <sameo@linux.intel.com>
> > > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > > Cc: Alexandre Courbot <gnurou@gmail.com>
> > > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > > Cc: Lee Jones <lee.jones@linaro.org>
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: 61dd2ca2d44e ("mfd: intel_soc_pmic_core: Add lookup ta=
ble for Panel Control as GPIO signal")
> > > > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.i=
ntel.com>
> > > >=20
> > > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > >=20
> > > Applied to drm-intel trees, thanks for patch, reviews&acks.
> >=20
> > Do what now?  How can you apply a patch for a subsystem you don't h=
ave
> > responsibility for?  This is bound to cause merge conflicts.
>=20
> Oh crap, I thought Linus' ack was for the mfd stuff and didn't bother
> double-checking with MAINTAINTERS. Should I throw it out again and yo=
u'll
> pick it up, or ok as such?

Yes please.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
