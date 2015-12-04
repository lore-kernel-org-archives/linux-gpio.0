From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/2] fdsfsd
Date: Fri,  4 Dec 2015 17:06:23 +0800
Message-ID: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:52065 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755721AbbLDJQE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 04:16:04 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

Phil Reid (2):
  gpiolib: prevent fault 'Unable to handle kernel paging request at
    virtual address'
  gpio-pca953x: Add set_multiple to allow multiple bits to be set in one
    write.

 drivers/gpio/gpio-pca953x.c | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c      |  2 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

-- 
1.8.3.1

