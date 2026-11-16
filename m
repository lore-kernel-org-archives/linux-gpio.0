Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849284;
	b=JWzr/IeRrL5S8hgg3me3YpTUPEBpsGw/av7TokMSI/esLfpDv/2kktlt5VarA6W1OXkH
	 q+QAeP6LZCLMLMIS0BsskbWptv/UlLAsRInDuR29N8d36TxOli4HnqWgf6VK6BPpAXr+0
	 +QSErM2YF1Aw72r6xyFn+8daXCop/ld9dtYFa2tTxWyJrCLBrFaRblVW0b0REJPn8G/QA
	 NhUyAoJNJYVjtNTPb6b9M7HD5CfHKsX+7pgPmDQYeU1BiT0LZYP+uaVS32uNgpHuh4+vq
	 otemgG4XMJJNYbfLfvr6jXcVugvqiG+u2rrDJ95e+cEJNNdBzd1+dK505k/gjZm9feg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849284;
	h=DMARC-Filter:From:To:Cc:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2NNpmYLbdgPgMNqUiUYgYgsPXoMe4KcDAgla4VWItL8=;
	b=IxT/426eEpDLmx18O3SbhVEKtYwog1PQL5mjlnFfcl3yNG86W4hMmrSHp83n77yDjZo0
	 qOGavrEqL5s/opH0u9bWvKHlJQ6EWSI7hAjBC/18u2TvYPKwsZMZeUGumxlAo2grpE+kx
	 uLADT3kZh4CG4pHM2ssg32HF5+I4AphKXDTlqAUlpFJ3wfWuVEEfojpLWGeeoxKixFnt0
	 PhYU+ozfrJbhdV9/RYPzbSwgLDMBBIXNncR4fTUECheFHckV0eUk+CzFd0B8YIuxilTz4
	 sjS/n9DHbUWws+aVrmqiTf2pET7+1SXezgJ2m4sBun1sUhRYoXBSsTR/1BBKIHRPXRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF39606A322;
	Mon, 16 Nov 2026 17:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF39606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
 Kalle Valo <kvalo@qca.qualcomm.com>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20261028034057.114021-1-rosenp@gmail.com>
References: <20261028034057.114021-1-rosenp@gmail.com>
Subject: Re: [PATCH ath-next v2] wifi: ath9k: don't re-request the LED GPIO
 in ath9k_stop()
Message-Id: <179484912736.162984.3773383274958749597.b4-ty@b4>
Date: Mon, 16 Nov 2026 18:12:07 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 20:40:57 -0700, Rosen Penev wrote:
> wifi: ath9k: don't re-request the LED GPIO in ath9k_stop()

Applied to toke/ath9k-pending.git (main), thanks!

[1/1] wifi: ath9k: don't re-request the LED GPIO in ath9k_stop()
      https://git.kernel.org/toke/ath9k-pending/c/465fcc982a22

-Toke

