Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8FD1BD9D0
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 20:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863870; cv=none; b=O+dpc1W4/aY/fUa0a97Vlh/p+ev6OkImO3NjiAtG5G2uwJTT7d8sDMnLMIgEmVq2VI19QDOmlsgOBr1Pnx8jRMp6alERDt0GjKQAkmAHC5GhNlZv79UdbWIm6po6yvASiGYTr0suSIwBVodpalHMTOSgMb0nOD42oISPZjg3HZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863870; c=relaxed/simple;
	bh=Ufx0P8rDIIn9ux40wvheeHx/pbxLVtKnnNJRtf1/UGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XM8y2AR3aWSVKrmg/xTmPvoi08YY9/vPfy1Dm9vPVHKzleED2XD8VbYHpbqGcZACW8jDsTVwtpBDzHWSpaCBUUuPMMq17VEi6VKYuea4y6W0bOR7dD1QT1bXjE393VrobHeuK3FZahTGL3ds4UeEO0+EG9HqWsDm7EeUftrUnWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STQWa0hY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STQWa0hY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47db714766aso1080070f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787863867; x=1788468667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4l9pXpzpCQlA5EBOndwC9CK6cDBlGTJk1glTt5sjEdM=;
        b=STQWa0hYfUjcUsQHpHhLUNMgnoeJhTGIGZrgIvMFkuSNH+SeFZOl9sNNxajfEy035m
         xdBWZ3xHKjTrum5nYUWb4uWEwfJY5H40ZkWIkdfNuU323KLPSAQhXfOOyhMnp/pTrVg/
         uo4Nofa1Rv/eYJebhfRxqrmeAar5QKKu1qcvtJQkSz0gVRoWTC/SbTUUDuuzCeS0mM7E
         82GmwgF0/uA5dP9c0DMNnRgot85fpE702hdK/SIhPyeVhaXIuIoCU4ybA+2FFdCpCSao
         dd2oAwRPNxSSLZgBlvomoqJSaOqMwcTkyd69JR4+7mQdlz2SCNA4oRA4FaMh3qCQfPvN
         LnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787863867; x=1788468667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4l9pXpzpCQlA5EBOndwC9CK6cDBlGTJk1glTt5sjEdM=;
        b=UUfl1gXMPYV1PFwD/quC0sQaHrcasK0QvEFHTUSQZG1MYuFZSG4fMm+vyOIbY4c26M
         twbQ2xDhc289ds2HNk0mPQv9iI0aFbbncitGSXe84zxHIRaidoRF5SjqDY96voDOoPFu
         zjKSSZzN3Rsuqn6nD76cDc+2K1SDkeZkH6z6PylwAzW/gNSO8t3frNJ2ZHoptOFMwKNd
         RWZyJUJMVBHC1yn3zWL3gTj6FW7qoVnUgua8BA+8hRV9SVsNm/zyJ0aS7auQAl3fcrhN
         ZzhSD6V9Ag3t7/TALH2VvT83Wcmm/bDfYMUDFPPiM8llI7z2/cUekcxubuxqiL/plXZU
         /Bjg==
X-Forwarded-Encrypted: i=1; AHgh+RonMg2Hjt8ECVMF0DzDDyVOobn1aLdx4jVYrdo4/NpXbBVlS53oqJ5I/vQSWG6Sl/jAduvYtT7Qm9ao@vger.kernel.org
X-Gm-Message-State: AFuF++nQOdwiNfmwIfoxJ2pKpNjC100Tvaz14lEe7PfT3v1kiXFZatlr
	JRucFQxOPQLYup8yoNxFqrQ8YYNAN+1cx0hb5on1oAIMznlNI2KrgKMK
X-Gm-Gg: AR+sD101yuQeZ43yOkKibO3bHehIbyrozNgK2v/UBy04mLJP+MAF9jjaAjPCIS+BiLu
	ICIU8Xg+W5fol3UyAKa4nG31RwIaL6JuDL2abb4UwdJkrAeTrryX8fxYr1O6gHfO4le//pbsqpT
	z/41DF8Xzk0A1v+sDqwjfBAqpD8yQnpscF9OhBnJKLbPiwAAQD0u0jN536+VvhyCTL2hqpxZrQN
	UbLPRVUXkL0SiQTJEHVHj55rYuEV8r7AO9w/qPeAhfZvmhax1/OWOZMmJXV2LW40dKM7vnplksM
	7GOG7nWCRaXZ64DPR0+4PgXVZBY3tyNCr3FFh9MXUNti48GHtx2f5tGLXwcONhOkmv2m5arDNb6
	rdcG193XsNRaNy2eNarf2j23zQjCvuZeJnOUmGKR+KeX4UgINPXEqVdnTNVeQASELcuaHDqDMDH
	1Zmd0f1A1YtYW4zW/mL1BWz75N3OUFxTeCQjOHqb5+VyMzYSGutgoQEjj6Vuw=
X-Received: by 2002:a05:600c:8b26:b0:49a:ce8f:1a5e with SMTP id 5b1f17b1804b1-49b91a2bab2mr27494655e9.2.1787863867220;
        Thu, 27 Aug 2026 13:51:07 -0700 (PDT)
Received: from m2.. ([37.142.156.156])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm6458095e9.4.2026.08.27.13.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:51:06 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: linusw@kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	brgl@kernel.org,
	germain.hebert@ca.abb.com,
	rio@r26.me,
	brunoceg1@gmail.com,
	contact@christina-quast.de,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] HID: ft260: gpio: group sysfs attrs per HID interface
Date: Thu, 27 Aug 2026 23:50:55 +0300
Message-ID: <20260827205055.17510-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLmugu4-1_XvqwV1xYw0L8F3V6CDP8qW3PCSvVWY6gqh4w@mail.gmail.com>
References: <CAD++jLmugu4-1_XvqwV1xYw0L8F3V6CDP8qW3PCSvVWY6gqh4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 at 10:13 +0200, Linus Walleij wrote:
> Drop "gpio" from the subject of this patch, it's all about sysfs
> nothung else.

Agreed, the patch regroups the whole attribute set, I2C and UART
ones included. v2 will use:

  HID: ft260: group sysfs attrs per HID interface

Thanks,
Michael
