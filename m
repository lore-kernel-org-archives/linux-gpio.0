From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 1/4] gpio: clean up gpio-ranges documentation
Date: Wed, 14 Aug 2013 22:44:48 +0200
Message-ID: <CACRpkdYBFW8LivYw9V9aWkrmw-LqM7j5PV1UZMoxLwiAgtQ36A@mail.gmail.com>
References: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:42161 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933004Ab3HNUos (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2013 16:44:48 -0400
Received: by mail-oa0-f53.google.com with SMTP id k18so13461906oag.26
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2013 13:44:48 -0700 (PDT)
In-Reply-To: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>

On Fri, Aug 9, 2013 at 6:57 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> This change makes documentation of the the gpio-ranges property shorter
> and more succinct, more consistent with the style of the rest of the
> document, and not mention Linux-specifics such as the API
> pinctrl_request_gpio(); DT binding documents should be OS independant
> where at all possible. As part of this, the gpio-ranges property's format
> is described in BNF form, in order to match the rest of the document.
>
> This change also deprecates the #gpio-range-cells property. Such
> properties are useful when one node references a second node, and that
> second node dictates the format of the reference. However, that is not
> the case here; the definition of gpio-ranges itself always dictates its
> format entirely, and hence the value #gpio-range-cells must always be 3,
> and hence there is no point requiring any referenced node to include
> this property. The only remaining need for this property is to ensure
> compatibility of DTs with older SW that was written to support the
> previous version of the binding.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
> v4:

Patch applied.

Yours,
Linus Walleij
