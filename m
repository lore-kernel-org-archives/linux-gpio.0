From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] gpio: pca953x: Don't flip bits on PCA957x GPIO expanders
 when probing them.
Date: Mon, 23 Sep 2013 11:51:58 +0200
Message-ID: <52400F3E.5060303@free-electrons.com>
References: <1379108508-19933-1-git-send-email-gsmecher@threespeedlogic.com> <CACRpkdbwo5J9tx4KcPf5sVngCyqEkauqn0GFzJ844GuuixBFsQ@mail.gmail.com> <523CB21B.207@free-electrons.com> <CACRpkdaX++2N+jK6W3P6KgaCuyK1mJ9=mF9C=RZBq6vB_fdFmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:55184 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753649Ab3IWJwC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2013 05:52:02 -0400
In-Reply-To: <CACRpkdaX++2N+jK6W3P6KgaCuyK1mJ9=mF9C=RZBq6vB_fdFmA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

On 20/09/2013 23:06, Linus Walleij wrote:
> On Fri, Sep 20, 2013 at 10:37 PM, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
> 
>> However could you wait for until the end of this week end, to let me test
>> it on a real hardware?
> 
> Sure, no hurry.
> 

I tested the patch using the GPIO box connected to the Mirabox and I
didn't see any regression. So you can add my:

Tested-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

> Yours,
> Linus Walleij
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
