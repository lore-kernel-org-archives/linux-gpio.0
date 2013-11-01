From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH 1/2] gpio: tb10x: Fix checking return value of devm_ioremap_resource
Date: Fri, 1 Nov 2013 21:28:29 +0800
Message-ID: <CAFRkauD=8_QEheiTezp0uiY9qEw-KCxfvL4UY4rSo6vhoJ=stg@mail.gmail.com>
References: <1383184905.13635.1.camel@phoenix>
	<20131031124037.GA7093@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:60119 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976Ab3KAN2a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2013 09:28:30 -0400
Received: by mail-pd0-f182.google.com with SMTP id q10so3859061pdj.13
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2013 06:28:29 -0700 (PDT)
In-Reply-To: <20131031124037.GA7093@ab42.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

2013/10/31 Christian Ruppert <christian.ruppert@abilis.com>:
> On Thu, Oct 31, 2013 at 10:01:45AM +0800, Axel Lin wrote:
>> Also move platform_get_resource() call close to devm_ioremap_resource().
>> The implementation of devm_ioremap_resource() will also check mem parameter
>> and emit proper error.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Hi Linus,
I just found similar patches already merged in today's linux-next tree.
So you can ignore these 2 patches.

Regards,
Axel
