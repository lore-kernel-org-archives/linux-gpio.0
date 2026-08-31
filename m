Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD774E80B9
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186771; cv=none; b=QzU2xzFEc3TCklSLlSyAb47rdVU9pHGs5fXmlYjzegOKNJUWVV4fs+MjbBqfU3/LyXuAKO4rBSmqbsTWNQ8/vrzQPJ7VaQA+OwlV3ie+9WAlhYV9C2yRnWeZVX6NY0PM3XOCvS2Y1ZAfN0KWM3QMc6txE32g7OWuvp5GXKsY5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186771; c=relaxed/simple;
	bh=QjMSkXe0n6TBETzI3Ha2tiZ8wGiaGM9B4fBWkY0BniE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlafVssOoLyrFJ8X/VcU03u7L+kDYNKWqs0W3y+invv+vieJhcS/l3kkwGvFYuROHWPdkruhPKPBYFRcCAJOysk6hiJEkviOG2yW+nv0peW9oPIXob6vG7Ukp5XkEDxkZZdfS5DZRWKvX+oHmiPVLpg38Zuv1b4kSkEZCyG6kT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJnW45oV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJnW45oV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso23182485e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186767; x=1788791567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWaK2495asznjoEZZji7S7Kk6wtOsxYz8ipCUtATvyQ=;
        b=MJnW45oV/XbuoEXUI/vDyeIcwima7IgbqwDMnXUeA9/qA00WI2LnycOSpegEfjJ3bi
         S1l2OLs1aGxU+0h/CUa6vz8m9sMSYJBZzxdx7lDCCFZrHBRXqx2X9dbeF37ywz4aLyFs
         svOD5aWoe8Wi0PpjMjTLOF48AnhGbhzaNjLZ7pQGct4J26cb4GQnS6E3CdGCLXZQjL8q
         zr0Jc4kmjs+j8arYX+UYQq6cKwYODMTavh4E8/aW/6yuqkRRl6TPYgCVo5qAfFxPKC7X
         Il9T/BPZK3G/HB36augVssACj0reTm/X1Z0iDnDkdBsZHEQmzjac3rhGQTE1ZDhxjbYv
         +4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186767; x=1788791567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWaK2495asznjoEZZji7S7Kk6wtOsxYz8ipCUtATvyQ=;
        b=M+XivyJ+njJqnNLLjxp6cWakyVfMCDJ4p9bfz8vVPpHy8GFaihOYAdgiYNfoXp2p+q
         k7A1r1q77QMmEK5mvQZevQsupTx0YGAuJJKu0hisawQuHGdJDjmmol+0B1ySsRc3fkeU
         uWeF5QXvMsXycXel8EU7O6A379s5SR0DzmxwZe+yvlRFnPdHcfA6Q+xZSibJxZEUreuD
         sWTowmN3AfqQO93pBII2icfbL9BJ1Ypn4VHD3w4w1YnLLc/OKIFx9glYjrrm2L52y63p
         YPC0ffUvmLm1jZT3yAAl3K6RSZutpUcK2xPFwwOvWFF7LPWcKS67rRqLojfD2GDYFosu
         XafA==
X-Forwarded-Encrypted: i=1; AHgh+RqbBiDw62/dcR08Ze/OqTVm3y0IuHIli9HP3k4xxblp1YjP4cDNBOTSEF1TtbVHrkB77ONfxpKB6QTO@vger.kernel.org
X-Gm-Message-State: AFuF++lBqnbWd++0Qieut7gkAYe/8DWfk4Xgf6ugtRYTql7DdJSnfP6b
	qSphw4Q0NZx9K9DsjPzYmggq80O1r6/51nqiT2/torfM2vA3YPiPSZqz
X-Gm-Gg: AR+sD113j0D6xsWNRjGHLv6SyTLtJ3udgcMPHaQm9Z22oOubSoBF93BZQ4qsaAxNQP1
	JglafPJwwB1uhByj+abP3ap4ay+IDmxsu4EvDs1Vj5iFN2Ycp/yR5ZPE+EK5yuZ2qduH/RJDHgv
	KR111dauRPKt2gyer+Gr/szH7Rm2D3TvjiobdjIOQPREgjNR/8juXJ8V0sfLVNQptDEDwa38g4V
	lkYALsGm9QxtV8QRE4aOAUr6RYCV72O9EZcf61s4ttKrlfsvM9bP4tMHnbl2N2XMFJovMfPlegt
	TyUM6/8oNHn1v1Czgu/mzRxnfgRAVNyqrRrCZgCxmC1Ng29BbbMPU++MHhnrnZxfXR+Ko43uw/7
	+ruOtKkdFp0sam8VYu4NzIG44HejBjMEt39A99y45iaHzVgUsjXuCcu7pXoXgUUea5XZnYR9s9W
	uBtMkIo3rbPihKieuj052kbGAsCqhWiJue5Y4eWrroNiZiu7ptBi92OipqOP6kY8VpsVKV3Qz4x
	tzvWRgpta2HNi6PLUSdxnj8
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr330092135e9.14.1788186767364;
        Mon, 31 Aug 2026 07:32:47 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:45 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 6/7] docs: ioctl: fix stale NVMe registry entry and note N conflict
Date: Mon, 31 Aug 2026 11:31:24 -0300
Message-ID: <20260831143125.151360-7-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NVMe row pointed at drivers/block/nvme.c, which no longer exists,
and ioctl numbers 0x80-0x83 overlap between ntsync.h and nvme_ioctl.h
without a conflict! marker.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..bb7004e6043d 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -181,8 +181,9 @@ Code  Seq#    Include File                                             Comments
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
 'M'   00-0F  drivers/video/fsl-diu-fb.h                                conflict!
 'N'   00-1F  drivers/usb/scanner.h
-'N'   40-7F  drivers/block/nvme.c
-'N'   80-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
+'N'   40-7F  uapi/linux/nvme_ioctl.h
+'N'   80-83  uapi/linux/ntsync.h and uapi/linux/nvme_ioctl.h           conflict!
+'N'   84-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
                                                                        <mailto:wine-devel@winehq.org>
 'O'   00-06  mtd/ubi-user.h                                            UBI
 'P'   all    linux/soundcard.h                                         conflict!
-- 
2.43.0

