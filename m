From: Pramod Gurav <pramod.gurav@smartplayin.com>
Subject: Re: [PATCH] ASoC: remove use of gpiochip_remove() retval
Date: Wed, 01 Oct 2014 17:17:44 +0530
Message-ID: <542BE9E0.3080007@smartplayin.com>
References: <1412142466-14932-1-git-send-email-pramod.gurav@smartplayin.com> <20141001113809.GT4273@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp66.ord1c.emailsrvr.com ([108.166.43.66]:38389 "EHLO
	smtp66.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751063AbaJALoM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Oct 2014 07:44:12 -0400
In-Reply-To: <20141001113809.GT4273@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org

On Wednesday 01 October 2014 05:08 PM, Mark Brown wrote:
> On Wed, Oct 01, 2014 at 11:17:46AM +0530, Pramod Gurav wrote:
>> Get rid of using return value from gpiochip_remove() as it returns
>> void with a new change in kernel.
> 
> Applied, I'm assuming that the API change is going to be introduced in a
> future kernel version since obviously it'll break the build otherwise.
> 
Mark please revert the changes as these are already present in
linux-next master. I realized it late. Sorry for trouble.

Thanks
Pramod
