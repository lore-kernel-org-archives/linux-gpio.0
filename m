From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] gpio/mxc: implement reading output gpio value
Date: Wed, 5 Aug 2015 14:43:05 -0300
Message-ID: <CAOMZO5C3mh+vYV_ZHA8hAq2UwY_TcO5sZxqLQDyNvs0VuVvJAg@mail.gmail.com>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
	<1438795388-22743-3-git-send-email-edubezval@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:34933 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752472AbbHERnH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2015 13:43:07 -0400
In-Reply-To: <1438795388-22743-3-git-send-email-edubezval@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ubrindis56@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Eduardo,

On Wed, Aug 5, 2015 at 2:23 PM, Eduardo Valentin <edubezval@gmail.com> wrote:
> In current implementation, reading the value of an output gpio
> always return 0. The reason is because when a gpio is configured

Have you tried setting the SION bit for the pad?

This should fix the problem.

Regards,

Fabio Estevam
