Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8953311954;
	Thu, 18 Jun 2026 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794495; cv=none; b=G78Hvvldm0vsLLJN/cdD8gzU1KmDyEe0gnbSbVrn8oVQvV23l0aYUSor3/0yI6JG8EdEJgA1SezgevVv3drkrK9+/TZsHouAb1GqR4mDm42FuX1Z1IDSRqWEPpygIqQE4wz3eX3InqFeJ4XWKKpPXHAiIMqVnCN7iBFLUrDaOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794495; c=relaxed/simple;
	bh=YDFHRCtMsExj7xytJHvcI01IC3A4ZIMSF311dGLQCF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b1Fmm0aVlQzEbqqjGTppfgND7Zu/XAiJ1c35QcgjrHofZ2ARJCoQhlWXpl7zBr9+qYP94IXKoNpW+6W2A5Kj9D65puu5kzmE6kAowlDhsb/O4vMjojRNSdFc8slvd70WfBgnOPfv2zLE+Nc9hkVZbRiPingtiYCf2Nj0ig7ulLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=cmFculJQ; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="cmFculJQ"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee9309;
	Thu, 18 Jun 2026 22:49:31 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap updates
Date: Thu, 18 Jun 2026 22:49:26 +0800
Message-Id: <20260618144926.3551915-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618081554.zifCwv4I@linutronix.de>
References: <20260618081554.zifCwv4I@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb356b4b03a1kunm8568d9c4a672e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU1NVhgfQ0NDT0JMGRlCSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cmFculJQF7D37En2zbn82en138LkdfjCBj0yBmO4+GRPq8Ied/pBxVpckJujr6a3F+UBUHVVRDpauSvNFc8NamAaS3Xlnb2HLNMtND++JsY0OJaUsXAz274oOSJiiNBlae1riz0w8FoBQBNGSrNYZQ+vZhKWGptxTPDJq1xhgDk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=YDFHRCtMsExj7xytJHvcI01IC3A4ZIMSF311dGLQCF8=;
	h=date:mime-version:subject:message-id:from;

Hi,

Thanks everyone for the feedback.

I will not send the irq_bus_sync_unlock/shadow-state patch for now. From
Sebastian's comments, it sounds like the more important question is
whether this should be handled at the regmap locking/cache level, or by
using a raw lock only where the regmap path is known to be safe.

Herve, your point about other GPIO controllers is fair. I should not
treat PLGPIO as special without checking the wider pattern. I will look
at other irq_enable/irq_disable users that combine irqchip callbacks,
driver spinlocks and regmap_update_bits(), and compare whether they are
using MMIO/flat cache/raw regmap locking or a sleepable regmap path.

For the current PLGPIO draft, I will hold it back until I can answer
whether the right fix belongs in this driver or in the common regmap/GPIO
pattern.

Thanks,
Runyu
