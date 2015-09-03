From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Thu, 3 Sep 2015 20:05:40 +0200
Message-ID: <20150903200540.399a96b8@x2>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
	<7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
	<20150821175216.GE1729@kw.sim.vm.gnt>
	<20150821224824.3406caa0@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33917 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753827AbbICSDv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2015 14:03:51 -0400
Received: by wicfx3 with SMTP id fx3so28302252wic.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2015 11:03:50 -0700 (PDT)
In-Reply-To: <20150821224824.3406caa0@x2>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-gpio@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

Hi,

On Fri, 21 Aug 2015 22:48:24 +0200, Vincent Pelletier
<plr.vincent@gmail.com> wrote:
> On Fri, 21 Aug 2015 19:52:16 +0200, Simon Guinot
> <simon.guinot@sequanux.org> wrote:
> > Please, could you describe a setup (as simple as possible) allowing to
> > reproduce the issue ? I'll try it on my side.
> [...]
> > Please try to make the module list needed to reproduce the issue as
> > short as possible. Ideally only gpio_f7188x would be needed.
> 
> The simplest I could find so far needs gpio-input-polled with 20ms
> polling period (I didn't try to change polling period), and a shell loop
> writing to gpioXX/value.

Have you had a chance to reproduce this issue ?
Can I do something to help ?

Regards,
-- 
Vincent Pelletier
