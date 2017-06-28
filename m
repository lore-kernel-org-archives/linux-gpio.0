From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: expose only some GPIO pins
Date: Wed, 28 Jun 2017 12:12:04 -0700
Message-ID: <20170628191204.GP18666@tuxbook>
References: <1498164850-4738-1-git-send-email-timur@codeaurora.org>
 <CACRpkdZeDjS_g27=1e7uCmFpjnqX+sDSu5G2VAuwFr_GJW1mug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:33826 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751501AbdF1TMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jun 2017 15:12:10 -0400
Received: by mail-pf0-f174.google.com with SMTP id s66so38000219pfs.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jun 2017 12:12:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdZeDjS_g27=1e7uCmFpjnqX+sDSu5G2VAuwFr_GJW1mug@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri 23 Jun 05:33 PDT 2017, Linus Walleij wrote:

> On Thu, Jun 22, 2017 at 10:54 PM, Timur Tabi <timur@codeaurora.org> wrote:
> 
> > On Qualcomm Technologies QDF2xxx platforms, only a subset of the GPIOs
> > are actually available to the HLOS.  The others are blocked by the XPU,
> > and any attempt to access them will cause an XPU violation that halts
> > the system.
> 
> That's a bummer. Looking for Björn's review on this patch.
> 

The TLMM block on this platform has N gpios, regardless of the XPU
configuration. The ACPI table provides the kernel with a list of
available "logical" GPIOs based on some system specification (or
reference design perhaps?).

I have not seen the Qualcomm server platforms, but I imagine that
customers can alter this list.


I think the numbering of the GPIOs should be that of the TLMM and the
"logical" names should be populated from ACPI by using gpio_chip->names.

The question left is how to represent the XPU locked gpios - a problem
we do share with in the mobile TLMM drivers.


It seems that if we extend the msm_pingroup with a flag to carry the XPU
lock information and then implement pinmux_ops->request() and deny any
requests on the locked pins, we should cover all[*] the normal GPIO code
paths.

[*] Except the reported case of gpiochip_add_data() looping over all
pins and calling get_direction() without first requesting the pin.

@Linus, do you see any flaws in this scheme?


PS. gpiochip_generic_request() ends up calling pinmux_ops->request()

Regards,
Bjorn
