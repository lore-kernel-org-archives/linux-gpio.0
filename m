Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6337F313;
	Thu, 24 Sep 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256767; cv=none; b=fZtz5+C2GN/BvKhkPdrDHDIiR31pNIzolZVHeJO+xFy7RM+zhrwZoQxQQpf2IHeoQrDjVqI0aEmVWZfX/HczWnRlkvVSCBJkqrkCIXI4LoeKbPvcgWoY6KdxgJZ4cUoBwIwHWPrb5yt670dZkje/Z8Kv+5qATsIyMKE2gPs98Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256767; c=relaxed/simple;
	bh=GDM5v64SOvDtSAVbJcF0NrxjZbzVQBDJpiq8p1HRyok=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BjohgmYjQIwGuOyWOJhKqSkGt2HAaIxb9IUHBdtPOEM7JtFThl8i5f5BtUSHGqwkFnotB/gBteDa4RfxEqIxFyXuTQnwm9hK38elmc1KvUFaQw+SZVmutQZ5VW1eyL4daznH3KPwIsQNpOkhvcYiXpBNIISYw8oWJBzHTbDshbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vh6Ebza+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vh6Ebza+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF7F1F00893;
	Thu, 24 Sep 2026 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256760;
	bh=1SCrjyBMNsiSm+WwS9W1jaYt3k+J1l8AiS+OnvCsLRY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Vh6Ebza+sTBMqBwgRoO3lHucpr+othQGMGsIpS52Sok/MdISLUImplvRomnih7es2
	 M7zXTY1lCbr3xVM7q4GJdbJSXERH+hccBXWE/9RsNI3Q7oBz/IT+o8CZ4OwKiP2Obo
	 RtwTBX8MosBkz79DmY5MO7A5yY1qGLiDZtZyr8SSAYP8xsrZWRiyUPTUktctIHzi7t
	 9FoQcwXZViZ1xINBE7DWODt36UsxYKuDzyBa1MnDMODtGUspjX3NYkM1cH6wpXMp8P
	 msG0sUsOqtLjukgaV/9cLS5YvoLeuDs7LDsZADPwmDdUIx38x1jKzlVkZqVFxwZqN9
	 HC+fDImo7o8yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198F239FD333;
	Thu, 24 Sep 2026 13:31:31 +0000 (UTC)
Subject: Re: [GIT PULL] Pin control fixes for the v7.3 series
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLmSO0q+PnZRo2cOE02P6sQubU0ZYvgrx2sskm1Py-aQcA@mail.gmail.com>
References: <CAD++jLmSO0q+PnZRo2cOE02P6sQubU0ZYvgrx2sskm1Py-aQcA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLmSO0q+PnZRo2cOE02P6sQubU0ZYvgrx2sskm1Py-aQcA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.3-2
X-PR-Tracked-Commit-Id: ae2c5bf969573708cd5b6bb6393631255d83c3fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
Message-Id: <179025668975.1550318.3041000926462054882.pr-tracker-bot@kernel.org>
Date: Thu, 24 Sep 2026 13:31:29 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, "hpp.iscas" <hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 24 Sep 2026 13:23:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
