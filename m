From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Implement get_direction callback
Date: Wed, 30 Mar 2016 08:15:16 -0600
Message-ID: <56FBDF74.3040400@wwwdotorg.org>
References: <1459177104-24353-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:35828 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978AbcC3OPT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2016 10:15:19 -0400
In-Reply-To: <1459177104-24353-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org

On 03/28/2016 08:58 AM, Stefan Wahren wrote:
> Implement gpio_chip's get_direction() callback, that lets other
> drivers get particular GPIOs direction using gpiod_get_direction().

Reviewed-by: Stephen Warren <swarren@wwwdotorg.org>

