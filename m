From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 4/5] gpio: vf610: use container_of() to get state
 container
Date: Thu, 27 Aug 2015 09:27:01 -0700
Message-ID: <191acc37c2e95c5cbbdf72e3edfaa187@agner.ch>
References: <1440687355-17157-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:57371 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852AbbH0Q1T (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 12:27:19 -0400
In-Reply-To: <1440687355-17157-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On 2015-08-27 07:55, Linus Walleij wrote:
> The state container of the vf610 GPIO driver is sometimes
> extracted from the gpio_chip exploiting the fact that offsetof()
> the struct gpio_chip inside the struct vf610_gpio_port is 0, so
> the container_of() is in practice a noop. However if a member
> is added to struct vf610_gpio_port in front of struct gpio_chip,
> things will break. Using proper container_of() avoids this
> problem.
> 
> Semantically this is a noop, the compiler will optimize it away,
> but syntactically it makes me happier.
> 
> Also replace some explicit container_of() calls with the helper
> function.

Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan
