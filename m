Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745254749F4;
	Fri, 16 Oct 2026 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164280; cv=none; b=DgTnFLEA0xvs0YCWYaASz1AmJ5rcqeGS3m5NjvBwDZvBNhObP/XM9PboUfDo2U8vkJD96Be5WK1BB/K69Ulm4yJ8u6/xx+M1j7B3ONch8E/FA27DtJIwEy7zbVG9F171ICWlBoTpLNzkg93vxKksSNeGCfvWB3nXgbkzZBQMQpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164280; c=relaxed/simple;
	bh=5z7RmMA2t8fBZjWeNfDwXRiC/wFbsQcoYKBw2KmVZOs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X1WqIptGv4cr3U/fvKMPJa6RG+Ral1X6IFAgn21Ji76TI580RVvQKtuRuEwVgLI4bKV6h4WqyNpcT/HsZfA//4vCwOjZ1QqSZ9mrLQTvkiAubUcbilDjgA6I7BpJ1BvDgMGZ2igu+gvR1NMXeskZg42nakLny14kSUiQrloe4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVGKduxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVGKduxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446391F000C4;
	Fri, 16 Oct 2026 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164275;
	bh=164gxn+8J3i3SsYo807lJb1eLkrFnAE3nWo0JhNP2xM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JVGKduxSUOlAA+86T5v5rfDhngev/3n5ka4cpE048Zxnss0nuswPrd73Ul9Vmf3uJ
	 +TheBDme3g0veJQV5E/sPvDule4TXu+lSoNe2uJXi7KFEBj3TVGNcmxDfi8kPdQakk
	 dd1jLT1N3gY6oi3CFmbO0/bMUx/iaAjfTya0WVDju3QDASA75RdGAgs9PGhig5h1PA
	 aMaKm+CgF0cydmXZRDXrZR9PMl0ghgAJUaxP/xPf33l9amnMy/GV7HgvEL7pvcjDxW
	 zEkx46ezS9h1A0Bw1v/iV5g/1uRtv2whT5ZbqvlWY4zdO37/Qdc4htWjGuS6NqoWIN
	 smQ7QKlypjMSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A280380A96A;
	Fri, 16 Oct 2026 15:24:35 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261016084154.39009-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261016084154.39009-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261016084154.39009-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3
X-PR-Tracked-Commit-Id: 205cccd06e545694754e1bf8d626ea96e742cd8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 586a28a179864ffe425e31087584b2ba07385fe0
Message-Id: <179216427385.816915.11059341778962164892.pr-tracker-bot@kernel.org>
Date: Fri, 16 Oct 2026 15:24:33 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 10:41:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/586a28a179864ffe425e31087584b2ba07385fe0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
