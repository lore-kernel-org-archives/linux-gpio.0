Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB574E06CB;
	Fri, 16 Oct 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164283; cv=none; b=OEzBi/1irS7+jg9AtwxJtECn5newKwE0RakEPWiU9hLug+R2e+QJxJ8sgzkH86BwpPqGhs5M9uS3p9kld5IDpMW5u6HmURIxBtJA8xCMOtllwyGN9K5rsGbl4a66TzLPbmu/H7ilolhrN3o5wxmbWY8DTmJr4+lgEpZuj+fcAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164283; c=relaxed/simple;
	bh=dW6ig8X0/MWFEjNjjdFOdJ0diqExqFQQl0jFU/9TvQI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ouWvl1zvnAsGv8EWtH+REWiBBkK2t5POpA2kN06F/VnRaz6ci9btAE9v3MJ0+h+zYA+I5ceehxZ9F81otzX+HlSXY0kaOyMzFvzKVsIGspl9UDW78T4US2MKE6pepcykIGzn6QtLI8SQAhCXQIq1bNU6QCBlTM+w6TGl8RzB0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Trjnvm0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Trjnvm0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063C61F000C5;
	Fri, 16 Oct 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164277;
	bh=ZvaUcg51lhSJNAQUkHmO5a5MhfCplXt33vwzoGtustA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Trjnvm0QqjnoIfxT8z4fwrCEayLBidfvqWibewecKxeNEJD/wMmU86BKuir7+DUKo
	 HtNDJJWKk8YmgTpP8A+8eszyheNYuZVncCK5Lxi60r6bKo9XyOnpanDu2HwNbgmdzy
	 9hNhIhfSvf3AOFOA8T4aUOZhE/lO7TVM94eGL1M+kxgxT6AngjAtJhyAQY5i2MKe1u
	 E1n+37YmQ8gjE06fEl2e+KF3X7nE04Bdo8fiG/ExDWtaVpCLQtFWWIrhwuGM+hIZMd
	 oNjXeouxWXptGg+Olh2HBLAcpZ5Fv67soU6Jk2tHvBcP/FIEshGVOu+nirCBeLjy8W
	 79fZT8mP4bXOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14ED380A96A;
	Fri, 16 Oct 2026 15:24:36 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jL=ZDuXfj8GCCapkF3vxo55pzuEcU_98GkbALDpCcRdGSQ@mail.gmail.com>
References: <CAD++jL=ZDuXfj8GCCapkF3vxo55pzuEcU_98GkbALDpCcRdGSQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jL=ZDuXfj8GCCapkF3vxo55pzuEcU_98GkbALDpCcRdGSQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.3-3
X-PR-Tracked-Commit-Id: c5895eadf287116434b7b01d67b92e8146f7ff61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
Message-Id: <179216427559.816915.14964667981162184242.pr-tracker-bot@kernel.org>
Date: Fri, 16 Oct 2026 15:24:35 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 10:57:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
