From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Sat, 22 Aug 2015 19:04:43 +0200
Message-ID: <20150822190443.284fd243@x2>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
	<7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
	<20150821175216.GE1729@kw.sim.vm.gnt>
	<20150821224824.3406caa0@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:33489 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092AbbHVREp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Aug 2015 13:04:45 -0400
Received: by wijp15 with SMTP id p15so42728518wij.0
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2015 10:04:44 -0700 (PDT)
In-Reply-To: <20150821224824.3406caa0@x2>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-gpio@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

On Fri, 21 Aug 2015 22:48:24 +0200, Vincent Pelletier
<plr.vincent@gmail.com> wrote:
> With just two such loops poking at (out) GPIOs, it does not happen.

Re-reading my mail, I realise this was not clear: this is without
input-gpio-polled but just two shell loops switching a GPIO each.

Regards,
-- 
Vincent Pelletier
