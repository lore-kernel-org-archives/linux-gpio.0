From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: Intel ICH GPIOs compatibility IDs
Date: Thu, 6 Feb 2014 10:57:44 +0100
Message-ID: <20140206095744.GA21598@ks3318809.kimsufi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:40738 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755932AbaBFJ5r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2014 04:57:47 -0500
Received: by mail-wg0-f53.google.com with SMTP id y10so1109318wgg.20
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2014 01:57:46 -0800 (PST)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: asierra@xes-inc.com
Cc: linux-gpio@vger.kernel.org

Hi,

I'm working on adding Avoton support for ich_gpio. I noticed that
GPIOs compatibility IDs defined into linux/drivers/mfd/lpc_ich.h
aren't arbitrary but I can't find any trace of it into ICH10 and
Avoton datasheet. How can I defined the right one?

Thanks,
-- 
Vincent Donnefort
