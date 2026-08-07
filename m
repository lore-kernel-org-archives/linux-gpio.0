Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D53A0E93;
	Fri,  7 Aug 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131848; cv=none; b=p54Vfpcksb8ZNqrwVXgfey6eCOArCYkrGyCGxNi22G6XIx7pgXsERh6mWymkuR8oAO1lOmHC0/2/cBAhzujQ+rWeqQtA0VJsfe69B08N+UPDj2B7wCE7JirDYmDVqJ2k0CAdyXsn/9YYRjTyCRXbvRrvj6LcjdNUG1szveqk+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131848; c=relaxed/simple;
	bh=lJwFU//jjAgB7Gm9jMfkyGi+mfHzsvuWLAjBspzSTRc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Q+OUZTmWT/hNHH5xkSDZMqEr2+VN8jYq0aFJTMBogwVKPx6opcs339EB+nD9uhjGN+eX7Svr6fjkGrlqw68PUlRHUghwe6Ip3JVuN+B5slnUHgW99F+C8fSa4Sqd2ar2qt9ecO7MWm+GHj/S71q9HH0AIro48/IMD5Fjz+MNEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbxFcALP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbxFcALP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57901F000E9;
	Fri,  7 Aug 2026 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786131846;
	bh=zSXPhSiWWeTEeFFah1kLWBjXMdfs40w+NKWhCb4JAsM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CbxFcALPKHfe7Gp5h5pSPG5GWuqXqKKj43cWauZqfHVF/OQQPr7aEIh7+OyI7qQMX
	 NkKZyrrIBhljdC4sv3MxI+h6YihbpV/hDBUi0wl4jlFa6JYWyX/aa51ZSfI5SHTeL3
	 6BdvM+oZ+5OMoy3ifDo3ZeknGA0ApiFMg/Tj7xQuo753ZidNQrdUal5HjAjv+vQ2RZ
	 MEm3fvSECFhbc/UCVIwt1MpmrQfHojjL3bOL3hZv+AE4d/YvO/5opnRryQDfXYNwc0
	 ZkxMF4/Iq5ru7FWro+pjjhwjSI7MGOH6VTJk6MVLyL1JqLrnMRwYsuRffTfqkG99ay
	 m26n/xaRDBliw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A96380CEEB;
	Fri,  7 Aug 2026 19:43:26 +0000 (UTC)
Subject: Re: [GIT PULL] late pin control fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jL=uF6tB3VawdPjdPTLFD5ca+2PqPYyYE6PQTPiqe_B=Mw@mail.gmail.com>
References: <CAD++jL=uF6tB3VawdPjdPTLFD5ca+2PqPYyYE6PQTPiqe_B=Mw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jL=uF6tB3VawdPjdPTLFD5ca+2PqPYyYE6PQTPiqe_B=Mw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.2-3
X-PR-Tracked-Commit-Id: 696ff859f5f93a7cedab2a2afa20bd1635918fcf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f008280327ba5ad132965abab0c7846283cef0c
Message-Id: <178613180526.2387967.10990028120035090973.pr-tracker-bot@kernel.org>
Date: Fri, 07 Aug 2026 19:43:25 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 7 Aug 2026 21:04:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f008280327ba5ad132965abab0c7846283cef0c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
