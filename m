Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD83AE1A2;
	Tue, 16 Jun 2026 02:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575888; cv=none; b=dCCJgYdd26XlzOi5H3QV2l+wJVehbRc6hVS8eK42/6HOfdnqMcdmrrbxvXi2Da3FRSTCmntsSvfqsRAPsRJPh1b3ZvFxdeVf7ab6wUYSmoQskJpPi4dOvbaKBCU7aQDgRZdZBEMzve9bwsPwKnQNOvUQYscG6bNvDcjd8HXNJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575888; c=relaxed/simple;
	bh=6BLm3a02p4esv+BYr9MLxVOX5dIVvOOyQPKF+8s0P1Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nS3uXVPjJtY/d/0WZd1IdQHKmVImAFKlakqJhcAyUOzAyiX8fhR04O2Z/l3PNGHRXqd0pUxDndzuew/M6nV4XRRSn7R7LaZmTk5j4FeZea5y8E658GieH/R2SqnnbOXjRsqxrBXnMRbQtrJnZFGKBeUz4keeJ425VzaueVPfQVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTRMK3r2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTRMK3r2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3254C1F000E9;
	Tue, 16 Jun 2026 02:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781575887;
	bh=3Mxq3KPY7JUPHAevg+VkeGN3dN02FfOCbominiarrQ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hTRMK3r23JX0ZVb2Ns0C1sUkyIrDOSs3KJNxefMpCMoU8gSX0U0pfGDjKMitmNjxY
	 PgGv4QUwekE35+XMfBeqRlMNfy7AZjUqNm9kBCk4PbmxfWs3RkO2Bcjm5gTWxlCp4F
	 EkFEcxep1K11/FxuPgavZYIfiuyhlO4wGzbrc6wJTqxTksCSfb+t53TF7jGGqruTFJ
	 wY8KnliCovqOPbjHuOc5j7wvBPBt4KGu/Cwn4zbSltftz4zqPTA90fge5uIllV5Ypq
	 Cdv4YYOA5Zk2AHuVRH5+d0sAbGAUVpLtGr98A2LzAXtusreuU462w9d7RYQX+VBjpZ
	 1USl5BuSWIehA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C473839A26;
	Tue, 16 Jun 2026 02:11:23 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.2-rc1
X-PR-Tracked-Commit-Id: f953585dafd71ecb0897f9def9c0a3702afc1bf8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77d084d66b7694e2a912abdd8b9e5a0e7a32d28e
Message-Id: <178157588195.390807.5690656305735845222.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 02:11:21 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jun 2026 10:29:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77d084d66b7694e2a912abdd8b9e5a0e7a32d28e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
