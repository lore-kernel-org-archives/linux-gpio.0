From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: tb10x: Convert to use module_platform_driver
Date: Tue, 12 Nov 2013 20:36:38 +0100
Message-ID: <CACRpkdYjfHENRx5ShrFzm20TOmz9WEgoiX2Piee1588asPaPqA@mail.gmail.com>
References: <1383184905.13635.1.camel@phoenix>
	<1383184982.13635.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:35716 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301Ab3KLTgj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2013 14:36:39 -0500
Received: by mail-oa0-f43.google.com with SMTP id g12so5833799oah.16
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2013 11:36:38 -0800 (PST)
In-Reply-To: <1383184982.13635.3.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Oct 31, 2013 at 3:03 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Use module_platform_driver to simplify the code.
> In additional, this is a DT only driver, thus also remove of_match_ptr.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

I've already merged a patch like this from Wei Yongjun, but
thanks anyway!

Yours,
Linus Walleij
