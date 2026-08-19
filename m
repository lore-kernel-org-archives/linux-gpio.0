Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A34647D44A;
	Wed, 19 Aug 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160073; cv=none; b=JZW/RnmPc7EatC6NUwVluU0dxo6m3WP+kfLIKBysII0ObCXOASMKUmjfGxyauPET2dIHOXYAY9V/byrIqpF6iSod1fipPykhFUdYgC50ec3lMtEaAAn4A42fDpaSA+SOHOlCWD8I2B1DKh49qwP7PTe3b9JX7tXt/GMAIrsdzE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160073; c=relaxed/simple;
	bh=Anr4KnD5VGpLlpnNjiMt7vi0LmQbRGlSCiDcDcg6zec=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=d04Wex7j1PZa7i3jHhs2VZIf98RCKX/vw+oRXUDx0YogbXSlukB/U4C3S4deIOW13lLcMGcauIr8+21HguXRZR8N8ei5EimPQiyqoGPGupLlLYz985xy7QgzCtLWKAgCtWiHEYdbA8wCWHFmy8XkYo+0LT0d4kmjxZfmrCsjt5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih+mB9JL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih+mB9JL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A488C1F32F2D;
	Wed, 19 Aug 2026 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787160060;
	bh=ZFx288tGh937Aga74DhVQ4dBZQM0OgBiBfxU+Tczcmg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ih+mB9JLzsVyP2rIFUi7Mc4UWxQdT9e6mdJLarHqMUAk8ISWLyxuVCSXn0gbLFMAB
	 DXHuzc3/uzXGim4XLtk+1Tq26biLwo5r6BfmyTXdtMWSCf3Fbs63a3DqNbKilpIhli
	 6PLmFrWtEMvRMUbOtVu+mZpFCa448gfDCsoeCj/MW6PY9Ss8Mb/MQqD40WX71KoYks
	 Qa1hg8o2S2jg9PaP4lFyuaYLmwebJ8HRlQx0bqoxZ5F7ZcKBerHKetusdH+uTgujP3
	 9qPWdLJrgk0rIxb+DT4255N2StaebMbZlehsJlKx2WHgIPbkCc5PWsW5NjpcOiPDlH
	 8K72frIg+tSUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D097138119E6;
	Wed, 19 Aug 2026 17:20:12 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v7.3-rc1
X-PR-Tracked-Commit-Id: 408866669ce01b8f2111afdea2c13d15a8960bff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aaef12abc48c27b65d9ff2de0a232723a1f06c8d
Message-Id: <178716001163.3599392.17264511432381848609.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 17:20:11 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 13 Aug 2026 10:12:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aaef12abc48c27b65d9ff2de0a232723a1f06c8d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
