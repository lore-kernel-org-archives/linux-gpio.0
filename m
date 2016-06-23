From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sx150x: Update OF configuration
Date: Thu, 23 Jun 2016 11:08:39 +0200
Message-ID: <CACRpkdbcaJq+g7YWbv5xYZ=su_-Hpfi1fZP8Ne6o5mOQuDCJhA@mail.gmail.com>
References: <1466157063-10955-1-git-send-email-narmstrong@baylibre.com>
 <20160620155744.GA1419@rob-hp-laptop> <CACRpkdbWPKbQRnO4v9GcY4BMTbp1ivMO6TFa-u-QpRyyZED0oQ@mail.gmail.com>
 <576B9B3A.2070808@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34966 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbcFWJIk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 05:08:40 -0400
Received: by mail-oi0-f45.google.com with SMTP id r2so60935759oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 02:08:40 -0700 (PDT)
In-Reply-To: <576B9B3A.2070808@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 23, 2016 at 10:18 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> Would you agree to :
>  - Push the minimal code to make OF work again, at least for 4.7 ?
>  - Engage complete refactoring to transform it in a real gpio+pinctrl driver ?

Sounds like a plan, as long as the DT maintainers agree.

Yours,
Linus Walleij
