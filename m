From: Michael Stickel <ms@mycable.de>
Subject: question: Multiple mcp23s08 on one chip-select with OF
Date: Thu, 12 Jun 2014 10:12:52 +0200
Message-ID: <53996104.9070103@mycable.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.mycable.de ([46.4.59.52]:56777 "EHLO mail.mycable.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932889AbaFLIV0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 Jun 2014 04:21:26 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mycable.de (Postfix) with ESMTP id 4F8C235A5E03
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2014 10:12:53 +0200 (CEST)
Received: from mail.mycable.de ([127.0.0.1])
	by localhost (mail.mycable.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id x2vdnwCvPWA1 for <linux-gpio@vger.kernel.org>;
	Thu, 12 Jun 2014 10:12:53 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mycable.de (Postfix) with ESMTP id 1A52435AE0E3
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2014 10:12:53 +0200 (CEST)
Received: from mail.mycable.de ([127.0.0.1])
	by localhost (mail.mycable.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yJ9KRTOwPVpR for <linux-gpio@vger.kernel.org>;
	Thu, 12 Jun 2014 10:12:53 +0200 (CEST)
Received: from [10.27.1.106] (31-17-105-194-dynip.superkabel.de [31.17.105.194])
	by mail.mycable.de (Postfix) with ESMTPSA id E8C4535A5E03
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2014 10:12:52 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Introduction:
 Multiple mcp23s08 can be accessed individually with the same
chip-select when they have different addresses configured.
They are configured as one spi-slave and there is one spi-chip created
for each mcp23s08.

My Question:
 How can I reference a single mcp23s08 gpio-chip in my device-tree. When
I use the of-handle of the spi-slave, I only reference the first mcp23s08.

Best Regards
Michael
