Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130895;
	b=tkgS8u6No64+CQLT9gtN9MQkU52V5uCq/01IwWdidh/kI05U0Y+fTIyO0CNOTbBb60aJ
	 a+lRNw0vk5Bgaj/WXtJs2AeOlp6oFYlgV1Tnz1k0vZ+kPIcLOEmTYhZRi3WvESTTLT4CM
	 Z4hASB7xK4dfxwx5QKqWQO7yxp7LDUaM8gEg51zkh0Dyd1la+I9BjLE+dOoP3Knz5eCd6
	 G70tZSpsGTCSesn98MlFsVaXegGv5D4K819eDUdhFlCQw5gnbPwo6h1u1U20VKEPOGvH2
	 4TKTMxwjwya6SxeEiN8BYR4BE5CL+K4n2E3kWFSN5oBfrfaZENSsIez+V8O6GhcisQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130895;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=9/o/W5tNcdOKYmk/LYihUWpWeggbfuzqwss5u7J69Ig=;
	b=n7isjNTgF5kdy0Cy42z1IrmKg1VflD42W7vhEqCPdNbsXYetTC3pT/EXbETV4KPeGm3K
	 yTk3SPk6b0o+KM4UuouVn/cjtZpmrI1bfMAiWPULtHDErg4iJbSZfHXEiejKpOS6Iwsgn
	 OQ6xzSkF2gOB0Ni1d7gLrLYu5aKdtnEeCjlZ73OjipAYplXA+965L05VyeU1H2ynmPmIx
	 zEKRRjFEX79Wg1kFSFvXnBSS1DJVFSo0zvD7ZT7z+SM2S0FN3ihHMgdVYX5UFf1L7lVc4
	 YzYfz0g4vbGxERkVGG0ZE81ojWLVrYVq5oNK4KtBl0d+W8PTNZxE6RJ3DRGCwoXA3yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b="MN5f/I3K";
	arc=none smtp.remote-ip=185.136.64.227
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE860A260E
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 23:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BE860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=MN5f/I3K
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261119232809f397b8e5e100020753
        for <linux-gpio@vger.kernel.org>;
        Fri, 20 Nov 2026 00:28:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9/o/W5tNcdOKYmk/LYihUWpWeggbfuzqwss5u7J69Ig=;
 b=MN5f/I3KOygkqTg61wdZXXmkAAUJQaGGAz//+N9iPobqJr8Seg1FSW/8m5AY5ujqSkQ1Lv
 THtzWfV/3+DIgbunZBHTxdOfHZty9uTziZb4y9UWhWyqG3KFCCFwxdGvsaTkMK+fmPbj922U
 oioPmAie3e/gOU8sCmbFOkfscyKkyu+TXuZFA/XbH6UQiiofy+dU+qY5N+fagJcXAfaiPRq+
 oJdleITYU36jcyyyG5r73fkDSUnlFPgeQdvRWCEUQ2T8DBDeI/3YzcxW+9k/n6lPc7VkXYlg
 afEETQo5gJYWUgIk/vrvqQ+QqzWIK0oJwWLWfA6gxHOlQkIqKMMVMcuQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 0/3] pinctrl: single: follow-up fixes from review
Date: Fri, 20 Nov 2026 00:28:02 +0100
Message-ID: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

These are follow-ups to commit ad2093840ca3 ("pinctrl: single: don't leak
group/function tables on consumer re-probe") in pinctrl/for-next, which
this series is based on. All three issues were found in code review
(partly while reviewing Lee's recent pinctrl-single series [1]). None of
them was reproduced, so the series is compile-tested only (W=1, ARM).

1/3 is a gap in ad2093840ca3 itself: the duplicate function is freed, but
its pinconf table isn't. My re-probe testing of ad2093840ca3 (TPM
bind/unbind loop on an AM625 board, watching the slab counters) could not
have shown it. That controller is plain "pinctrl-single" without
PCS_FEAT_PINCONF, so pcs_parse_pinconf() never runs there. kmemleak
doesn't see it either, because the table stays reachable through devres.

2/3 fixes error paths that remove a group/function the core deduplicated,
i.e. one still used by an earlier mapping. Reaching them needs an
allocation failure during a consumer re-probe.

3/3 rejects bit-per-mux without a usable function mask. Such DTs pass
dt-validate but divide by zero at runtime. Checked with dt-validate and
against all in-tree bit-per-mux users, but not booted.

[1] https://lore.kernel.org/all/20261119205013.2563811-10-lee@kernel.org/

Alexander Sverdlin (3):
  pinctrl: single: Also free the pinconf table of a duplicate function
  pinctrl: single: Don't remove deduplicated groups and functions on
    error
  pinctrl: single: Reject bit-per-mux without a usable function mask

 drivers/pinctrl/pinctrl-single.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.56.1

