From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: rt5677 gpio+irq questions
Date: Tue, 21 Oct 2014 09:42:50 -0700
Message-ID: <CAOMFOmWdVdF+mtLYhw3fSy9g6XCyfYqwdpDNtj6rXmjd9jw74Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:34988 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932304AbaJUQmv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 12:42:51 -0400
Received: by mail-vc0-f182.google.com with SMTP id la4so736399vcb.41
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2014 09:42:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: benzh@google.com

Hi

We work with Realtek on implementing IRQ support for rt5677 codec [1].
This IRQ is used to monitor MicJack/Headphone detection events.

I have two questions wrt irq/gpio library that I would like to clarify:

1) rt5677 has 3 IRQ sources (called jd1 jd2 jd3), each of these
sources can be enabled and assigned to a codecGPIO separately. Each
irq source also has "status" register that shows whether the gpio line
is asserted.

I am looking at regmap_irq{} structure and see it has field "mask". Do
I understand correctly that "mask" is used both to enable IRQ *and*
check IRQ status? Currently we set "mask" to "enable register" thus
handle_nested_irq() is called for *all enabled* irq sources. Would it
be better to have an additional field in regmap_irq{} that can also
specify "status" register, so handle_nested_irq() will be called for
asserted gpio only?


2) rt5677 chip irq is quite interesting as its irq output line value
is ORed values of irq inputs. i.e. IRQ_OUT == (JD1 | JD2 | JD3). And
here is the problem. Imaging we plugged micjack and headphone. Let's
assume these lines are assigned to JD1 and JD2. Both gpio lines became
high with some delay between the events. IRQ_OUT becomes high and chip
irq handler is called... for the first irq sources (e.g. jd1). A
moment later jd2 also becomes high but it does not affect IRQ_OUT and
these is no way for SoC to know that irq event happened in codec.

Realtek engineers suggested following idea: every time handler is
called for codec's gpio it reverts value of JDXinput sources (there is
a special register that inverts it). Thus IRQ_OUT goes down. Next
event will raise IRQ_OUT again and it also be inverted after handling
it.

Is it possible to do with current regmap-irq implementation?



[1] http://thread.gmane.org/gmane.linux.alsa.devel/128764
