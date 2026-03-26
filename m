Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2414218AB;
	Thu, 26 Mar 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546255; cv=none; b=AZVMdgdEAzsBl0T8kSdropiB1qXgwdwzVHXZTgWvlOccUgVBKMA0UejB+tpZmD8iPOA7BbPU2L+GXW2XfxzdUBw9bjdy+AT8uqXyxqCEvsjVP6FFaZ8B+Q0s8CinVau6hIU35Y/b57UEQSNbrX9xrEY+pJsvv+zd8PwNFFnD7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546255; c=relaxed/simple;
	bh=dxDyYQsDmdFOjxBPbRVEAIlgrTxeufCY4DlADpUejpA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kWRCi+mz72PZCmUKWr1C20wMZYmd5O8qQrFzzUpfMeguV0pDYlKBZqDK6tscc/Z+k7dPIw1LiWUpYO5fjbYkvAJ/9Jxo+oPLm5jEyfaROarTRhgMbshs2sQeHpLBdKLBwM+Nt+XFqsdBFHyZfrhR/NNSv63cz85b6QX8VIEdMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki+2YDuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki+2YDuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4346BC116C6;
	Thu, 26 Mar 2026 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546254;
	bh=dxDyYQsDmdFOjxBPbRVEAIlgrTxeufCY4DlADpUejpA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ki+2YDucd/NLnQtG7UrRh6PGEXTiup708nkCBe6rBv7X24paP+pdW6KpQxjT2mK6g
	 6yKmVvpklR291JqLHnzMFgHKztUcfLpkRpN5letWFSoaXsKGAUCv2x/pNFq+WRTGoT
	 pd0dVKwDD+gBQRlNT1/9pXboIMDPQi+RPUOkq+cthUaNoLW4FH6Z2+U6bYt9G03G+x
	 vfWV8Wbx9jt9etzom8/vaV0y+fpmX2yoMZcitRRekIKP2Xj99HmFzu4dBVDCr8wQ/7
	 0End6XMvvD/7oHnjcd4OMGMzmufVagd6u1XQ/CvZ9YFCLdmB+V4iqTbARSP+1e6ZQB
	 AJ2B8E6TfP8eQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E1339F2037;
	Thu, 26 Mar 2026 17:30:42 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jL=tNGv75VN6XJ4GKGWbqP9PsTb-DzpitiWEsJtz5g5Emw@mail.gmail.com>
References: <CAD++jL=tNGv75VN6XJ4GKGWbqP9PsTb-DzpitiWEsJtz5g5Emw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jL=tNGv75VN6XJ4GKGWbqP9PsTb-DzpitiWEsJtz5g5Emw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-3
X-PR-Tracked-Commit-Id: 70f8915ea4e909826306a8567c7fa46959e278db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75c78a4faa7efe3180d1ba4b323464e30f948a43
Message-Id: <177454624045.3098378.3696003336983646620.pr-tracker-bot@kernel.org>
Date: Thu, 26 Mar 2026 17:30:40 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 26 Mar 2026 13:37:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75c78a4faa7efe3180d1ba4b323464e30f948a43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
