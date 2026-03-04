Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7D372EE9
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772642845; cv=none; b=U5EB9yIawxMKmCRdQgT0Tue28VeaSTQX2Fg07NMxUDb6AUnvT6+sOWefOWNhNwANKvoLaUCatC41Egpkzcc9LrV6IBagyj2VV8ScOmeWCeqGBJzeEaAq5/ZiDV7JfpaTbCNAcqInFi5F6qS68XlxAies2kd5f2pZYGGtj/ix3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772642845; c=relaxed/simple;
	bh=nhpTIth+kvozNdkK/uAqdnTVx8Wa272gqsw4ftj+FRU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=a/bFsDwOYN04v95pHThzUjaP/uv9315RhtFo/bg7rs9ykHeph/Mibp8/4NojhVobPKA4Rh5GrYAlQWb2XHfRPWYC5j8d66I1OPWdbbrpUNHAmEfjHtsPgfsCz5etsGRRQnJJ1s9u3XRFCiQl0o7lEjosZNJWS+Cc8fUXQjoRizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrbpa/uP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrbpa/uP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9F2C4CEF7;
	Wed,  4 Mar 2026 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772642844;
	bh=nhpTIth+kvozNdkK/uAqdnTVx8Wa272gqsw4ftj+FRU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hrbpa/uP8XmWC7qMU4WmR0gQMewj15AoVGx1V6Wz7FL7T2TQMLhtwk66TrWH6QzqU
	 2zKbM9W+maV0ACw8pCPpfvw45CxL0IogAOx4Mj2an/oe+IrPi0D0pLMH9tFmjAvocF
	 tK93K0s3b04scNDeW52iNQivgfZgAgRAe8LzXZDfDIhnvjFGnqiPgJZPnnytqEvmDd
	 plkmkXrCzoLn5JbOmnkw5tt+juP8JuaniDo5h1CU2RooYqDMxtO1WKWxTCQgt9TRBO
	 PMMcSzjLblPSFj8nJs7R5WemzqhDFnN5N5Eo9fLq/9fr5BYCUBV0P6ERnO4lqXvo4K
	 huIZafLDJocew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1313808200;
	Wed,  4 Mar 2026 16:47:26 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
References: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-2
X-PR-Tracked-Commit-Id: b6c3af46c26f2d07c10a1452adc34b821719327e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40d3f622477ccd99118498df5283941bf546dd9c
Message-Id: <177264284523.2299690.4493629634466307875.pr-tracker-bot@kernel.org>
Date: Wed, 04 Mar 2026 16:47:25 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 4 Mar 2026 09:05:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40d3f622477ccd99118498df5283941bf546dd9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
