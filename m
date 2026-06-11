Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7B3A3E9C;
	Thu, 11 Jun 2026 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781211514; cv=none; b=dAwQs18HUWxhuj5fVrj0/0y1vtQzgbQwWtc4viUd0S9MIIlq+ur0ExRXilws1qFTtYIJembnjCuPJoqs8BKHUVVcBOHjhDhffkjYlWUa8Ar7oAmkz485tE5HVkrUrCvrrK1Xb9HnjM9IpNkKzNSEIaxwZBCwDEPby8KOXIm4CCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781211514; c=relaxed/simple;
	bh=I+X+mEn9Gp4k0c3zhg5VQaMNhJUTgRZo2z3sbp36dtg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oUdt6UzitFysrb9ow7S61bK3m6EKO6lIdTMp7oKUaNG1tht63grTUQ5dBMtU0r+/6U8CCE6k2hazHKpfpskdJiTGtl9nQZ/XrALsD3y2iVRd2CG6HvAcYuc6jAdML+BiOCA7GrYEBgpQyJJzN3ajd/kIW/yUs7Va5IkYSdFPWjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nstT6kU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nstT6kU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261981F000E9;
	Thu, 11 Jun 2026 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781211513;
	bh=dyKFasu507rHbbrMwRtEYi9C6I/47zF7RQflU7jDv5k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nstT6kU2PY1fKIXk+gNGmjEDnf+titD3QSsviM0GS751fyV30PWpfDm++D7/25UDK
	 oFPNhnBBO0Wshq3K2mhqVqw6Lvwbw4a7KKr2qpsFJkltGdDzgBdABq13HJtYGv8hES
	 OEjeMs/Xc79lG+m94HmuJ/yH4mpdezu3OhdHwsk+L9pMrSjHKyXMYt5pAOLnQkyb7r
	 /LE9CFq86GDVPm0maUn3fLKrKpLeurkWDXHwhFm1dWFS9D2N09ZlCw80yBTQLj7eLR
	 TYg6gVmNRRyFOQYhMW4zrkttUptEY1ZgVa5RkX1fOI+eUkHGXZIk8gtbTcZhY1hdNl
	 qNOeem98qHrlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A4D3930FAA;
	Thu, 11 Jun 2026 20:58:31 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260611074257.5012-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260611074257.5012-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260611074257.5012-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1
X-PR-Tracked-Commit-Id: a23226b7c1f69eafd9ced4e037fb51c9758c0501
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e9e0dfc7f2e34627a4280b8e168479018d95732
Message-Id: <178121151016.362744.6619312281653714520.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jun 2026 20:58:30 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 11 Jun 2026 09:42:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e9e0dfc7f2e34627a4280b8e168479018d95732

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
