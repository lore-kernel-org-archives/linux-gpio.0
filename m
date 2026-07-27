Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62342CB10;
	Mon, 27 Jul 2026 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785189040; cv=none; b=Ba73tIWvO8aEsOjlV+dMywy0iX3KcViO3u5BfxDJUTdMNxROZ1tDmrI9h1fcz/MgetB3+Da0UBQQf4jjNvUDG272qPJ8pCx2QVu9NJU/MVhaO5lQCCjpVmyjwRZ4+KSlmVZjU5nZVLNCuur9g8i6qv6fPZIbIwprh1vW6gLgGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785189040; c=relaxed/simple;
	bh=DahQ7uEyTSKe8CnlQMKnUVSBkeKG1l2zAn/rfaQGB1M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dmE5CNfuMldcUTE2DOVICt9Z06wS0xrcWXM4TMQ06U29RQR8Ykkd9T+S93Cff6KOoScCdyawjIc7HQ6PVYYNvTp7UGC8XDxZis1AhyLp4/xwFvFFOlaWZflyttsrGfrGAOGnFUd0M7IB4isiFaMeid2NSaRzdIRb5v4MzKQTWZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+ZMCRXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+ZMCRXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE791F00A3D;
	Mon, 27 Jul 2026 21:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785189039;
	bh=AGCXyBpE9SpDMwiP1bQks+H7aWHWWSWrkdmxhCrFoNo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h+ZMCRXxfsPzD9x3Dc+cEdwaqCJoX9qjZWmevXPUlTAJ3dnqGrOJsNlWg9581H0Rf
	 zxCmttpwpOpi/iasa9zFcHQ5V1xDyBO7H1O9/GV13bQCd7FktzztGKbHmh5cy6x6Wb
	 anCtgy+wKAPZOn0wYGB+yjOpiIHELyBsR4C4VvwsJa59HJ9vATq8+eqhStmD0lnSd0
	 f5G0YWGq5XkRrUq6a5U518EQeFZ9+4pmCXc7Mgg0Pd+M1CrtPuHqumD5Il6MP/gV3d
	 TOo9q9Y0D+yWOrpM/FXWmZicS5mDTzkCzFZ4p344cI7pOVZrYitApoAGM7dex4wPZ6
	 Vo/7m2YQpZB6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 948B7380CECE;
	Mon, 27 Jul 2026 21:50:05 +0000 (UTC)
Subject: Re: [GIT PULL] Pin control fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnO-2JY9VzFJi46PczKG6ePdwbn1ZJy-z+pcW-8RREnKg@mail.gmail.com>
References: <CAD++jLnO-2JY9VzFJi46PczKG6ePdwbn1ZJy-z+pcW-8RREnKg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnO-2JY9VzFJi46PczKG6ePdwbn1ZJy-z+pcW-8RREnKg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.2-2
X-PR-Tracked-Commit-Id: dad6e107b3cd9d20514e7799b7ad8674f81e3f30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e63c75f72faa04af24e4b11d4047e7ac1e80ba5b
Message-Id: <178518900451.1430666.5980288010653605826.pr-tracker-bot@kernel.org>
Date: Mon, 27 Jul 2026 21:50:04 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 27 Jul 2026 11:25:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e63c75f72faa04af24e4b11d4047e7ac1e80ba5b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
