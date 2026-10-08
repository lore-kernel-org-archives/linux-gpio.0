Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA634749DD;
	Thu,  8 Oct 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459432; cv=none; b=gTB7MXaU7ta7WC7KrfOj9sLc6ddx6NIxUjCL6yV9CKgPMagNeTVYhmEaHRcVh1xrFAEiqEGbNRXFgUovjFle+lSksLcHc0hpRt5gxDE4mUj+5tTgeOpzmHTzRdd7uQTbsXnBVOIXIx1hel5y7QlScRmn1WOsdc24vB9XS9kYwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459432; c=relaxed/simple;
	bh=MqPEXYCXF+MXEeCoF/wJVPsXmIQJaXJ4P51dW7EUkZY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=b8Ci2wL4+qpOfvt4tJ3ZTuxuL3ySRh0dBiJmakZJd1SwikZOsXYRAU+jIAYS1G3yZv/10hoY7mE2AunHE1C7vzJbi5oKpUoV2bOrCY206GHnWLxzfoP5nZjEF1k7d5p8hLJYltIfMr7bAJcsQ76lxeQFfAcwzN3LdfB/DBcgUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab4qb6bZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab4qb6bZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA901F000FF;
	Thu,  8 Oct 2026 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459431;
	bh=hoJcccyDV0Q8GCFJXaqrv7bSySfjrIWC6h32kSHs804=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ab4qb6bZB0CzhjUT1uO/Qsyyc3HlKyGsJQdkB0cDEZdIIfzv2v1JNKNkVQyq9cSuj
	 K9i7+wnWZgOfh0QJXxeZ6JkCf2gbnVLrP7sfN2etFpvn9T24jscQsAA32WJS+CRs/2
	 IejNaGXmDrVRt/5EdtZ7R7992CoSViWCggLBUmMc1SR7L17XSj8OVreAU5xBFFttVv
	 0tiQoW0x0KbrPn6YxFJt3RGIgOqxwQR97zTXXQ2mJU+cDcIS6TaQnF3w3nKWIa91vV
	 Bt1I1x7HcsIenPjeRNeByB8hbmw4bwYsoDMHIf5U6Xww8BsoX9aoJMsxpiVtH1m8dZ
	 WPEMpmLEYSb3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B46F3380AA4F;
	Thu,  8 Oct 2026 11:37:11 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261008085508.4815-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261008085508.4815-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261008085508.4815-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.3-rc7
X-PR-Tracked-Commit-Id: 7efa1a1953cd6b20b23a3524d5b4b81789c6ef25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 156c9ca041377f9ffa5967c7debc5fd0f667d395
Message-Id: <179145943044.227328.9291574122038826486.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2026 11:37:10 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  8 Oct 2026 10:55:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/156c9ca041377f9ffa5967c7debc5fd0f667d395

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
