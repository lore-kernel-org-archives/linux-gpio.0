Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015743016F5
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409910; cv=pass; b=RNljXTLf5DMSpOrRIVn7+yWbKwRlS5wRTpuXjOIl/oICsRt0pZ9aopXslSyzU/YTjkXN9iv/+9VfHeEPP8xTeaAeKw2Zlc5nY6J6KKJWJES9n+rDd0sXdNpYa6UY4S7DXoA7Gc2ZtcVf/Kvp+sKtGGlfBToC8ilJMhtnLe1yGgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409910; c=relaxed/simple;
	bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+V4anAa8OnsFL+7MxvyX8BMMgdUuOporZyJxsHnMd5UbiU8iAEbunnLmqrOEGN9BktU+vkl4rMcRfNL+Z+QxGfRenZn6oGVIRHOL8+LaPmaMn/H0yfvhDERJOSPBlGaHjMjVOztCDnI911dRqfwVgzkK0tczX1sHlBRDJvPdG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYfcg9/P; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYfcg9/P"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d72ae08fa1so17024875ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 21:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788409908; cv=none;
        d=google.com; s=arc-20260327;
        b=fyToQ5NnWRODZRJv2YNEPsYTzLDzScKLOemIKB+wv56SgFI8dRtFb2RhECmNtrpMw1
         vjrNg9PjhJCSbZI0vIB12qCN44ONuFmy7uwyXsfcH0VZhb2m9xy3d6VkPnMI4FSJy5Zp
         Asc4u9h+kKv2ovOA5DaN/7NQ+HKvK+75AkNw20B/o8qTA4q1FWRiYymuLufjiY0t57hK
         9lBuv29MhBuaTpI3AjwlgJUg7JAZvFRP3e4ORpDvjSlL+r1SW8Ah55gpHwmXqmyMScd7
         /AEhuP+HG2O1nrHfatQ02bQUBr8I6+bt4MpPOVbira9y+A7Xi+qSBx8q0YfY07oRNuRS
         Se1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        fh=9qAL6kTwb1Tk8Sc9PgmsUC8OH2tkqs8ABPKPxIr4Lu0=;
        b=OwsEvLoXH2Qtui7QFDuxp4acR4MbASHxqc75ZKZQdc+XZk4i06BV+3APvK+oJK59Kt
         EX+y8Qf/EvzwD8TGB5U6wFGdcRgf4ai0rSXPIPQ9VAOwwmHBsp11Zs2fkD9cUs6eRROz
         hyXau6zexl2b/PYZaV4kPE27Vd1U/U+yhi8oyQGWXoDtJ2e/bo4Akdq4CKF2d2Twulh0
         OtZvoa1cdw+p+g/xQc0UDAs9lScaE4W4T5fyBnZ4yHMTf43MQ4bVNxaGon7jNOZaXlIL
         ng9atQ0L5cfGDPYf/cuD8nfjNiVGhavQegAqSFLx/x9jt64WCjwEuKOD3zGgnKZ5KrWH
         5SuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788409908; x=1789014708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=SYfcg9/PWmQQ4F/wlS7haHL2eqvZWKThrm633pF9X77CWA4MYkxOwfquUP66urLgJI
         ezGIX/GjxtnFqHEE7/XO9TZzmityxZPPmKSnxlgW4NslUhaAOwU1hERQxazNBDHJM/kt
         DGB/1I2PG2KuB8Ij3Q0ec8XBN0qMnaOROntsOzTyrdhQqR8VowDMcA4NxIS+Wlod5yw4
         aB+HADgeUIcx3b2vBgrhk/BZxUCqBTvgvhdvTWAmYZSBYvGSYjCSNJD9LkxYhZdRXKg5
         Vw54U5rN1i+UwiLgq+POwv4U/F4f7JtcPvuBJ96PxRKna7+NG7S/7SnYdgUlTOlg/DLL
         knmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409908; x=1789014708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=WC1wk7wgECsn8VyI8TmRjLHnqGLB69xznc3pL1jQMgGhkMmmKq1OB3D2Zst4QjSsiS
         IJESkPSbp+4znfoGsPlNZd66B605oz75sytpaKs5SIKai5Rq5nhEihsgv8Muwrx4uQ/1
         6nYq/kdQla8Mx1u/7RhSp24W+a6VWULm7QIZk6/E1pWMYD/CjWhUF64N0vD6vt+y3YS8
         bv9KloCVzIAEu5Tic0fA1B8+TUbC0S/ECrn20m0sM6xFTmsLRyOzYMytGETRPPzz9iEi
         BNkuIwCmfORjokiaQXfImqtMt7Nh6/70Xwnz+Qffa/Tp3rK4FepFDwbLutcYPxcAxHxc
         kkwA==
X-Forwarded-Encrypted: i=1; AKwUvBy3VZiQ1Zxfb46B/tuhblEmnqxpEnzPSsw49rL2SpOtgm5kPzpwpyapEFVVRYPzXQN7kGHL77KUbFeW@vger.kernel.org
X-Gm-Message-State: AFuF++mWT3Q2ew45c7VPy406aNs+3rHEBQqBql3CWH5wn0+ctboBkD1l
	eDHvtOmQzF2V4oFcfIOtidTq6Mip1klg9TZkgTe3z5eamTMQxjQwWPGZUF6OW2qS8yoO5FDycRm
	UdWRDVqGZ71QHmV+0RUDVvAsjkGOkFVE=
X-Gm-Gg: AYBFou0eNS+HVpcg4rkGsRrNSGsp/oSxxDtoK/6CSt0wVy7JMs2/5rwbcUMoDZZDwES
	52Dd5KDvfk9rCOZsK5RK6hbnXEdmGP9eeOubmx4Sccc13kZD7G9cBDjEhASLy2W2RQGKNJnWr7f
	ovhlDMT4vwcuu3bBAi2XpLEonFub5TGbW0tsctNcMkKlUdKsfzvdSrL1yTo1n5dvB7yjoyl7w64
	2tff3eZSKfFTetspTK0HbqpKLxB8ZZ/mrlHXKtpp9O2vSIRk0zxEhC+/NPGZYpdj+HldpdirQWh
	nlGX7x6m4Lfxx3Y0PLgOW671eoWqkDOYrNLI3h+EkusFkprvrlo+wnWgr5o8VykDMFbefzg61F3
	FV9h6VB6kKkaLIymPZ7mCe1E8zPF2Qt+JP+LxQxhwx1dxPx475OecjfGMbvnmKj7+TC4=
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4d3:da51 with SMTP id
 d9443c01a7336-2daec7b84a3mr112445875ad.21.1788409908115; Wed, 02 Sep 2026
 21:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609031134.VMzbwyVl-lkp@intel.com>
In-Reply-To: <202609031134.VMzbwyVl-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 11:31:37 +0700
X-Gm-Features: AcwNN1UAGNeHZ0Ro131jH_gR3Av0iLt72gQZ7Ksi_o1wD_3WkkTyfR6Bijy5O5w
Message-ID: <CAABR9nH=-8AY6kgZKNNK9tWb4K8Ya7tUFn_9vYxm+AsaPw=O6g@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 5/8] drivers/gpio/gpio-altera.c:224:7: error:
 use of undeclared identifier 'irq'; did you mean 'girq'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have sent a fix for this issue:

https://lore.kernel.org/all/20260903030700.132068-1-phucduc.bui@gmail.com/

The patch is based on brgl/gpio/for-next.

Best regards,
Phuc
