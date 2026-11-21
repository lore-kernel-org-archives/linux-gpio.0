Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233423;
	b=rqZdoPUIYwusp57TxD/8khL0/pT78y4TNAXJdnuOr7pqec71ZMToQIIDnenCUMykNOYQ
	 2NTsrqZfT10G9s6u+ONHIyIKudYEP/W1pPJsQC0G1KloBn2VRHAIWkkVbKnwvqJDykrM0
	 J+vKgxKDEA29emXJ27y3lIc1GwNJLNWlOmAWUp0LD1qjhJ16Rx8fH5OpbNPmQ5WMj0FOv
	 qV63y+19vxNVzTtenJdrCHlM7EpM2k+4IWBHsfEHMNcD1pWb1F0lNpg6wrkfOwUF7PoNm
	 kZZMGI9mL/hZqHwF6PHV5qZKYY2dXtJkqTrn3nSAizzSwcu42HEhcId1hNp6qzfjzrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233423;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=G8p0TSCWue/2IzPUbVMJI+qmly71h/xWOgKJZdJUiDg=;
	b=Kl95MaAJ6x82CjtqyvztPjYoaC8T0fnK8T/6y2R9w6xpoqEyWWdiriHrkpeGfDidZWFP
	 kdTgrg2Q/66HhumurJ5ff6sm9k4ArKhyMq4icnnQyl6c1Qxdt6MoG8TU11TW1at9OHN+b
	 xBmbHHCzB+Sc0WLiFN8oXKD7SqEIGraOx0uqL/NP58UdaPr4CNd3KGkq/kM5Y0E14OHvF
	 oCj/tNX/Lltwnfr8RqOHEupJJ4EyzA98mrtMNQu05NZ1un8TARBSwHZvjkdYPzsCnGiTt
	 jeD4IOstG/HWrudyA5EVTg+DCg1yDEdwOqG9FQIb5wuGTIzj2c52bEY8qzgXezUsx9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5UpfQWp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728E606A6A6
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 03:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5UpfQWp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813A41F000C4;
	Sat, 21 Nov 2026 03:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795233423;
	bh=G8p0TSCWue/2IzPUbVMJI+qmly71h/xWOgKJZdJUiDg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=M5UpfQWpl1Kq9XeCroAAUc2tCicjuHtuTBWnv8sa67gJaNJzT/BLq8h2qlOiE2k+s
	 g+JFAblp9bq25uIImCFUow08QFyxwoVc7esJQ5yOIN01K3hG3DhvwBjq0YYoOMEBB5
	 ic2t3U8Lok1EBjqGkpDPtJGW7UChYts5X5WGF04L/PjU4AdQ0isa9crE05BKcAxAHW
	 2+vdMeUM0+2qJtsu90cCwh+r3qPCed1xDfrhkg0QX2X6pLRw66Z2Fa1OgrnP7ltqUp
	 zUzWhUIhX/7BXwgAno+L2X5OQ/uZpb6+gOvdZZfICxmhZCS42rxAPW0LwAQDPIemS7
	 3eU6y3SihaVog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7750C380AAFE;
	Sat, 21 Nov 2026 03:57:03 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLm13UUobkDTbXLMeyOxVywhquqxRNj4T8+SyhAeXJ8CPw@mail.gmail.com>
References: <CAD++jLm13UUobkDTbXLMeyOxVywhquqxRNj4T8+SyhAeXJ8CPw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLm13UUobkDTbXLMeyOxVywhquqxRNj4T8+SyhAeXJ8CPw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.4-2
X-PR-Tracked-Commit-Id: 5cf0969621bc014b5305e6ff8b7e28f20060c3e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b152d7176339f11f05457799be609268e1a61cf2
Message-Id: <179523342217.911893.1677398847211468153.pr-tracker-bot@kernel.org>
Date: Sat, 21 Nov 2026 03:57:02 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 21 Nov 2026 00:54:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b152d7176339f11f05457799be609268e1a61cf2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
