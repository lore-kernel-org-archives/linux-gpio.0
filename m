Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209241;
	b=l7LQYhL+1FwSTrrsFNfqEPdp6Zw22K+7AMoKA3AlZG8my/9/d0J7GLNYF8om3vmy8YW+
	 FQgeh2OG4BA3EUZUJAjhkO8a8ZlaKISBGulhxXy72RbqUs7hvlPzjenDrmqJ4hr5AgI+A
	 X5nyeeeB6DcjJS1Hu7n5ij06UbfUy4tee7CG4APpcuYE1yy57lpo8x7cl9/0raYFuU/IX
	 OeVCxgguKERaHt7VyjS1p61ZIPMpJHcYjJnAgB1eCW1r+ZtzEmKydhd3sDBbGatfTr13h
	 5WlL8Dt0Sfi4RE44YXHV5V3IhEZ/+WbPLw4gGpecc3Pz/+9HS2P+XyBfMDHGFBd25Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209241;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Y2qwJeFuBel3eIqphVrHJnM99TXaiNGsc4VfL62sonk=;
	b=Whjny6ZWn0IAhMU448B6Zt3RYmp5rD5Zle42PS/RPz1QhACV+CYCYY47Z09hZo8OwJET
	 kf6hYSBxx/0ZuquySbhUWgNlKJFbJmcAlSpD+dpW150s1Fxk8pKZhFDQufLDUSplDuBh0
	 D0/OC8xb1FVqdlUZV36H5Bd/tDU+O4v/7BNqRJPXF1U/UDPcHvdlg0yS4yw9O0/HJcmpw
	 ohQNhocsDVI/nHmewBbji24pvffekMzGLhZS3X+rNFPUHgET2Vl7Qw8HXtbkavSILw8ZU
	 tvGhihEhzJtdYBJkUM+AzOijzTtDeWmmpfhLmjBB6lwoIam20mQppONiL6oQK1UwOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEguhrRJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D1606A69C;
	Fri, 20 Nov 2026 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEguhrRJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC591F000D0;
	Fri, 20 Nov 2026 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209240;
	bh=Y2qwJeFuBel3eIqphVrHJnM99TXaiNGsc4VfL62sonk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QEguhrRJ1EQevTlTqO/OTDML5cGCDfcL6hL5rDrN8QwEWO8fFkgKBC4YObNSYWb4U
	 gTVblR+TFyNbMu552oCCYI10DXlIjqOgVBf7bUYC01jwABBvOQU9xw8e94QVvpyxp+
	 SRdxKAEugwmbSQun6K5v1n0VDm5nexENUkZZRTKsplQFXOvawzs8H5XI5uUoN7ucU8
	 MRjSNU0xzLieQqpqm4wkHH9Ralgwz0jnLA2qo/Fg51PelBrbc+1+rVXDOzzzCBD7CI
	 Yso2RcYQkU3PEPfpBWTLBN4fnrZjdTqZefOa4ZHSVfHpqGRFm8C7bWmZJNo18TQ1a2
	 BfD3JfXVtKZlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4515380A964;
	Fri, 20 Nov 2026 21:14:00 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261120130921.29111-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261120130921.29111-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261120130921.29111-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc4
X-PR-Tracked-Commit-Id: 31678e68f82636a27fbad58ae40054557da4fd7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0097b4aab00e02249532dfa5c1c10abc00d1cd59
Message-Id: <179520923936.792202.12813609766774256310.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2026 21:13:59 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 20 Nov 2026 14:09:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0097b4aab00e02249532dfa5c1c10abc00d1cd59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
