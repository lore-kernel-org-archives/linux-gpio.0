Received: from mailgw1029-46.conoha.ne.jp (mailgw1029-46.conoha.ne.jp [160.251.132.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C11B1D130E
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jul 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.251.132.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783182752; cv=none; b=UxHJUV0ii7soJN4QAdvbg0L60eU7vznt2ZvrkINl+57fAa9ZmyASVmwM3XSiHoSMNtLuCzWgX1ESIf0emVWlm5TFpzctFmafSgpRtdBF42shl1z9K828BFRpXqoMdZSnBI4FvbNvuX8WVxKkczlwuN9Y0HRYUW6wB+aAaFdGmCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783182752; c=relaxed/simple;
	bh=C7rnouymnSHx9Xj92DImDUBUJOZ67EDRrB12y+CBw/4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=S05kf0JNdCMO8fGepn08O0rvcKfwNN/rHDHF0VTJHc5aJjhGr8oKattfin59KzB879iqsGZNV2CKMRQmJTvvz91pcZQPhJ4ZRy+i1K27gYBRRsqkHFancRWgOqGbI8Yeu/3beU/6S8tybRDuq/GZoCtmkE8MgiMgh0Q52D/C1r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=naruto-cycle.com; spf=pass smtp.mailfrom=naruto-cycle.com; dkim=pass (2048-bit key) header.d=naruto-cycle.com header.i=@naruto-cycle.com header.b=pB6XBWhi; arc=none smtp.client-ip=160.251.132.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=naruto-cycle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naruto-cycle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naruto-cycle.com header.i=@naruto-cycle.com header.b="pB6XBWhi"
Received: from mail1007.conoha.ne.jp (unknown [172.22.44.62])
	by mailgw1029.conoha.ne.jp (Postfix) with ESMTP id 9FDCE10041990
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jul 2026 20:47:01 +0900 (JST)
Received: from www.naruto-cycle.com (www1021.conoha.ne.jp [160.251.148.51])
	by mail1007.conoha.ne.jp (Postfix) with ESMTPSA id 949202409D6D4
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jul 2026 20:47:01 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=naruto-cycle.com;
	s=default; t=1783165621; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=cSKWvbdGpiqcggrVKS2eObDfrSPa1WKkcb0lo5p14sk=;
	b=pB6XBWhie6ZMKJZStDxnpAbMLKxi1Uat6jltJyg6yo6Ftv9JcdMxDGdV8aiJBeyXXmqxhI
	jk7/oc6dTaD43gN22Ie8aikD0UR82fMSFBGAXAls2n5Kus4HnGbG0Sig0i8HeaxQ4sosrG
	r4gzuYb5/HYfeSvKFTNfsKbN/z/BkH0YTXz9d4AXzRW1hoUpjB426BEJnQljwb68+5yEdJ
	L4UXBk4RV1essMPNigOaW5X02RsVg6ceFRrVccmgcobd2iVD18r7FnRFouRhim8qCF7UHD
	u+UM8zO70k3kHCkHfvXMdlAxsVwuC5AaTBj8dl+G4FPGCUFRe0Fi0bwy1Pe1nQ==
Authentication-Results: mail1007.conoha.ne.jp;
	auth=pass smtp.auth=hash.cycling@naruto-cycle.com smtp.mailfrom=hash.cycling@naruto-cycle.com
Date: Sat, 4 Jul 2026 11:47:01 +0000
To: linux-gpio@vger.kernel.org
From: =?UTF-8?B?44Gq44KL44Go44K144Kk44GP44KL44Gj44Go77yB?= <hash.cycling@naruto-cycle.com>
Reply-To: hash.cycling@naruto-cycle.com
Subject: =?UTF-8?B?44Gq44KL44Go44K144Kk44Kv44Or44Gj44Go77yBICI/Pz8/Pz8i?=
Message-ID: <N424PoJbRTI1wRgKFlptKectPlRuw8d3kDwdgqwXqI@www.naruto-cycle.com>
X-Mailer: WPMailSMTP/Mailer/smtp 3.7.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

※このメールはシステムからの自動返信です。

Meceelderi様

この度はお問い合わせいただきありがとうございます。

以下の内容でお問い合わせを受付いたしました。
今しばらくお待ちくださいませ。

▼お問い合わせ内容▼
-------------------------------------------
Photos for my escort application are uploaded.   
Let me know if the quality is good.   
Preview: https://tinyurl.com/5n8cu8ep#xFst2P

-------------------------------------------

このメールは なるとサイクルっと！ (https://www.naruto-cycle.com) のお問い合わせフォームから送信されました

