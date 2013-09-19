From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: Provide helper macros for logging of GPIO events
Date: Thu, 19 Sep 2013 14:49:55 +0200
Message-ID: <CACRpkdaVRSZg-_xyVN_bS1C_ON_880NhXvZGoQgT-9KTOJQuOw@mail.gmail.com>
References: <1378719230-10931-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:54817 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753675Ab3ISMt4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2013 08:49:56 -0400
Received: by mail-ob0-f181.google.com with SMTP id gq1so9379403obb.40
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2013 05:49:55 -0700 (PDT)
In-Reply-To: <1378719230-10931-1-git-send-email-broonie@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Mark Brown <broonie@linaro.org>

On Mon, Sep 9, 2013 at 11:33 AM, Mark Brown <broonie@kernel.org> wrote:

> From: Mark Brown <broonie@linaro.org>
>
> Currently many but not all GPIO log messages log the GPIO number and the
> formats vary. Ensure that this is done consistently by defining logging
> helpers which take the GPIO descriptor.
>
> The will help people pattern matching on logs and providing the number
> makes the log messages that omitted it more useful.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Both patches applied.

Yours,
Linus Walleij
