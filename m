From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: [PATCH 2/2] gpio: max732x: Fix irq-events handler
Date: Wed, 22 Apr 2015 16:23:27 +0300
Message-ID: <CAJOTznXzQxTSKiN_1ATRVLFmaA9j2Hmh5=U+qe67NaEQOkV3pA@mail.gmail.com>
References: <1429637318-11089-1-git-send-email-semen.protsenko@globallogic.com>
	<553750ED.70209@linaro.org>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og108.obsmtp.com ([64.18.0.186]:36888 "EHLO
	exprod5og108.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757130AbbDVNXa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 09:23:30 -0400
Received: by lbbqq2 with SMTP id qq2so179846568lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2015 06:23:28 -0700 (PDT)
In-Reply-To: <553750ED.70209@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 22, 2015 at 10:42 AM, Grygorii.Strashko@linaro.org
<grygorii.strashko@linaro.org> wrote:
> Wouldn't handle_simple_irq() be a better choice here?

You are right, thanks! I sent the new version of patch.
