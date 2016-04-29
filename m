From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mfd: intel_soc_pmic_core: Terminate panel control GPIO
 lookup table correctly
Date: Fri, 29 Apr 2016 11:31:44 +0200
Message-ID: <CACRpkdasFcEAzDtHGU+unrsstyX+o1Ft=HAh22Esm5Z3KZ=2ug@mail.gmail.com>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33839 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752352AbcD2Jbp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2016 05:31:45 -0400
Received: by mail-oi0-f46.google.com with SMTP id k142so112506796oib.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2016 02:31:45 -0700 (PDT)
In-Reply-To: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Shobhit Kumar <shobhit.kumar@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, stable <stable@vger.kernel.org>

On Fri, Apr 22, 2016 at 9:38 PM,  <ville.syrjala@linux.intel.com> wrote=
:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> GPIO lookup tables are supposed to be zero terminated. Let's do that
> and avoid accidentally walking off the end.
>
> Cc: Shobhit Kumar <shobhit.kumar@intel.com>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: stable@vger.kernel.org
> Fixes: 61dd2ca2d44e ("mfd: intel_soc_pmic_core: Add lookup table for =
Panel Control as GPIO signal")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
