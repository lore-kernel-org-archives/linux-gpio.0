Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1F36A008;
	Mon,  3 Aug 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762323; cv=none; b=jcegnQPmn6xaWvBSxJz10dbAaHS4hjnY+mNxCzPwTYtBX0daZy5QGGJqmdW5v2eb1rtpR4Kqcq5cyYuedIr5KI7Ty7Bd5x6FkU8ISi6tq1EQO3AGFt6OHGFb+asA2b5+r5r1Fk3WOJRHiS8eehOSBSeZSOB26QegA2KKKPBB7xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762323; c=relaxed/simple;
	bh=Sjg9Fu+74998T4uZf1E6HD6vyzdpIzx/anPlAY35CBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nu91mrFK5Sv70hYcSprX+H0rVnm6ZDAgIvzFLKuCurWHx7lKA2Nx4TMbLCRvqFQCfAvbiol1frdpQZk9ZQwREYjaGuDRlKXIcQjNwd9cGtcYK79h+pxx7hXB+fUiplGRbTcsaMOKftE14E1Vf0AUxE1vYUbYR57QmkbYCeNPX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4GcgWSk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4GcgWSk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209181F000E9;
	Mon,  3 Aug 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762321;
	bh=BZP+7X3Uw5ZiqZ3CWxhIlqmxPiDSX9P3cuwNS1v6h28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M4GcgWSkF5genYsVaSXBZ3AMIxtPWql/hNVnqEDY+FEZTO2CTFXyYeWn/5eRWkpYV
	 MEmHNqCGPLfZY3H6sPXh3wvhb3dcaghqWZNdH97WuoI+cxHXT1AEKVV/IsoKWU/lrF
	 roJe6Jsgt2WY9Wji19Pp7dBQrR0mPbzWPvXSbRLAs6tFX/RfP4tuKWUSE7sltft8ZM
	 5Nzc8WwOb1pXknvLGJtOvt36QC4YN0BvlIhDwLnWZyF9TNJcYp6lhHyDVugCxx6afE
	 10hKu6BRks1nYkWsUxEoob59+0z5/fK4NfdmVf3nuweQc2oncWNX4m2pv5IyhsW7qc
	 7vgIiHQnZ2tpg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: implement get_direction()
Date: Mon,  3 Aug 2026 15:05:01 +0200
Message-ID: <178576221776.155079.14811751064714928381.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
References: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=383; i=chleroy@kernel.org; h=from:subject:message-id; bh=IrBaPxnph4YWN6xCAfs0TkjBzFIy+/PMRzuA4pYF9aw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQVTGLccCD81pRn7Av/J7fduq5Q1K0Rf5/D9R+LlpNF0 V+RW5x3O0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBE/LIZGaYmGVlJi25uOTL/ Yf/204tnpr0sfeHmmrxGbVe/9cnEFXMZ/immvJ0i+EtmeuxL1vg4h6W8DzPdbsk+35PxoCx9o1B dFicA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 12:09:40 +0200, Christophe Leroy (CS GROUP) wrote:
> The lack of get_direction() callback in this driver causes GPIOLIB to
> emit a warning. Implement it.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: implement get_direction()
      commit: e460ef309f44b39480209970f1dd462f051d6f30

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
