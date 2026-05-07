Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3772D837C;
	Thu,  7 May 2026 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778183206; cv=none; b=aYn4ndWN7WDaXQ3xI6lxXqZlBQeFnfHNFLlmZr7jiePXM9zFh7Uqt6fiwE1c5KwOAzggVcHTMHmEXHfbI3zHubBnMPEUATiSzZBSe/l7DUyzZsEpTS1hvQxzSLmm+9Y4Ydpp9kiTU+mZOnPJJAMSlacDCIViwI7RTMj9Y2aK2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778183206; c=relaxed/simple;
	bh=7bB+ATyqHoRJC3wlfnGnpRt/c0lYGvMKmXajhJ5OuWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mtkF6mh0ddjeBl6PB04pj10BqnG9kGxEY8UP736Mt+2M4olkKAZBLnMmbNT4lZsxS0G5AU+7CPskfAUyYAWY0dQIuOJrpxGWB1sfmjtpA13vAaF7t+22l+e7ZKKNRVpPL89Vaa+5reYANVJ4ohaj+77ifgE7zlTi22TjAXTudDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csnWnG8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csnWnG8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F57EC2BCB2;
	Thu,  7 May 2026 19:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778183206;
	bh=7bB+ATyqHoRJC3wlfnGnpRt/c0lYGvMKmXajhJ5OuWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=csnWnG8pgugQ16gwEm5dFJSXF5AenbsoQINTOt9hyMc+kfD51lTdfoB5edOkf+Wff
	 Ey0QL9iD1fBkPAfkLiSddm6hc9XYNZUDGdnQuH9tTq7r0r5a91u/ZtNWEnzLh68ZYr
	 rRhLSjQ4P3Vp1xz5MtSBvPa6Rn6rmUjPaKV/uMsKp9pDaEAT2VvdXgio6X3w5I6KJp
	 r9cQATpudHkm3br+w8aiVBk1ycAykORcefvdXYX+lUZ1ZqZKtIL2NoFEH8S6ro51M8
	 Q+CMcvEGiOhNXu1T4Bwzw46uvMC/SS8cfAv92X+w1U8fIpdbu5MZ+y+p9y3A9a90aW
	 k4VzNV5n8TpMw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427143437.3059210-1-arnd@kernel.org>
References: <20260427143437.3059210-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] mfd: wm8994: remove dead legacy-gpio code
Message-Id: <177818320404.2090690.8045287260615108343.b4-ty@b4>
Date: Thu, 07 May 2026 20:46:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 27 Apr 2026 16:34:27 +0200, Arnd Bergmann wrote:
> The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
> ("mfd: wm8994: Emulate level triggered interrupts if required") in
> linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
> in the wm8994_pdata structure, so this was always dead code.
> 
> Remove it now to reduce the dependency on the legacy gpio interfaces.
> 
> [...]

Applied, thanks!

[1/1] mfd: wm8994: remove dead legacy-gpio code
      commit: b0feaf240c31d48f6b2e74da2a604cfecce6c3c1

--
Lee Jones [李琼斯]

