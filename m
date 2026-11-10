Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305445;
	b=AkWydnJvF57TumMiI3L0aDTJiwiXT5jDc+wxpuhOrfRjV3/ZnjbgdfVFgnD9whNfhtMl
	 MX49a0aXAAtVMy05nEhBtIX1+1dPVXYutHX7/NTtRy5i5TSrcd39cVW4bZ4ZA3dW5dxnG
	 p9/dgdSty97p4pFNIUO9vK17KhYRqD8jW3+Lhfe2PB0oVND0P5wxGjQ/9KU10Qfoh6yWt
	 S8LEOZgBIG/cy2GVV5ikCFqDCpkglYJXL+zc2R4dAhpBMD5MwZ6xBgrgiGQgGts+PM+Sa
	 +GRBKY05m6SHuENAX0YCfu8FjlKX4AACooMky7Hu05Bhyqp1esC7UlnuqKp2CbS9lAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=77tgSSo7L1hMEDBWl5pe9JZcxH3eLtSx4Ca/ATuyomI=;
	b=0kP1pljkSj9wDIAuqFyblv2UngpxvEYUEyRzRG7TgDBYa3FaY4pjyfQ5LdfqZTVwwfEC
	 t+ok2cQ66LBLn88FvACyql8kIGQrEPtibtijEPZ8m8lCcTHdNf2dGHB5V0rEQkYCrb3h0
	 9iUBedMdysHAB02ogTITr7MW2pT3Rlkn0sjJaIkogXbOcxw/3TZI1OQ/krO1FM9pX8/qz
	 lqiRG/nmeZX4PFRauDfLyrneEk6LahGDSa8VrIbIwvxCIbq13gVxvlufa/HDiLuHFsNg/
	 lq9kIsbHnHsDAl/Hhyxsfd0TUS0wKlaYtkAotm2D6j/lzNAuhJKGg47njNWtoJkACyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai9OjkbJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyJOKIsO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40154606B51E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40154606B51E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai9OjkbJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyJOKIsO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lCXw2770746
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=77tgSSo7L1hMEDBWl5pe9J
	ZcxH3eLtSx4Ca/ATuyomI=; b=Ai9OjkbJrom0f88Hz8o8LfS+ZBtMldPDJ4eiGQ
	1JlT0noO0e6ZCN2xXgSPGmzIc/gDp9qcQIeqouvgoZkknB8Yi6QA2IOQF14Oe8eR
	orQLQxBFxBz0saM0MU/3To9XuMkSyaverpbmCHv40gUY9xABRRbFNeg9dmtndRsW
	IdQRMDTREwULML9G9x9Q3P+KrK/KDn7XaMqY9nIa3bUFsoMc547gv3jG7ddOgV4N
	ZUxnyGBTEejrM6CXcpDrtHyxGHVGR7Cvfd+UrrJRkNuEYAFkZeMj0DBTWk0V5gt7
	fCSGPK0UovqjTl6obDU3v0H7ZP4qK+8Z6ZfkIGtbnCXe4bvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9760-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:10:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so314190085a.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 02:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794305443; x=1794910243; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=77tgSSo7L1hMEDBWl5pe9JZcxH3eLtSx4Ca/ATuyomI=;
        b=jyJOKIsOYrKppLmqx8eTwgNSkhi2qRQYlXRq+Ja+Z+8D3Kvbt2vwzLQTBEfa6xXadt
         fwhHc3y7ZEbGDLRbe5ucyuywr63EYDL6WNZKchHdE9CPjfKT9W0+1MdkSnpC5PFZ2Wdp
         rCNB2yvNBytFi2jtQfxnHoT1C4R2141ChefLRSvtU+82tLIrPM5eusvIgXLpia6wx7lE
         pS9gkrrt5CT/OSAOy+YngtgiARBnKEvP2m1ySdfvVcqIUGNcBodP4FojDZe3rw8tKhmb
         nJMiJgmzAc8vpvSEu8+W498yCAh3sBICYgPbYgwVRbcri8R15Dkc1jBY+NC6InCqF6/Y
         ZHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305443; x=1794910243;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=77tgSSo7L1hMEDBWl5pe9JZcxH3eLtSx4Ca/ATuyomI=;
        b=ApOjezHbiFyqZkJJDy3s42xttVO9nXKYhcPQfX1CvEByPgBJ3tk0QhaMyi/1GqfsEF
         8FvuM/fm0f45ZHGG4f/9B4GxR4oyURF3WeWKY+tJz6l+xYSBHeOB9QeNprODv62gUPcx
         u3IgDPr6kCyVK6GI5AbnmYKFZ4sQa59ziYVcdbDwmjRBRk8gHeQqmkRc9Zc8bw52elfd
         oI5DGI0WvCPodhUNtBIdVqD9tzRHpZ9ldoLZlwB4kISKmY+NLPViiJ5IQaQJ6mWXvUcE
         KFrZzHVRKYn76mAI8gGz1Z+UO5xG4JuWRdF0zJUUTaMuuA5OUBTGBcriyjRHM/Vu5UuU
         Qxeg==
X-Gm-Message-State: APuU4Z+9PScN6yjiD6p5NHjLmpAr4roL4KTGn3MC999s8msZ1RUBkpHk
	tLGf5UEaLAkaNRc9dMfkxtWTmgnV9eR4AQ4e98LAJieCs1G+CmV9CVxDM6/EEp13patB7fyFtss
	1vtMDi5PyS/ZUu6rTUxphaSsjiVJe7kKCFwwZb2r+O4+QRNGYRVC+Gl+4N6iq5fCi
X-Gm-Gg: AYBFou1WTt4X40T+bG2UM7z1hJIoLzQ+ZBPaIW6LherAQ9pgvYtqx+EmDppzfNGlSBL
	huQUcgDXbKi8beK+UtvUHtgjwQ3QSKZ4XUp8qrFtC2uK0omdt/OH2IIm/GGE3beXavASYqPfIfl
	/EMgxClVjCFAkTLheuXs9XRBR6xtSFcpA2yMn0oPQkjz0cC60vKjW9+eO7wcNGfXlXeTcA97b8n
	RXmeLyGdB72hMY4c4sctflL0xaJYF8KzIRF8z0UOpuLG/C1ZCp4CaMeitE8wxQz+Y5M83pr9nq5
	QWdzVw6La4ejVrrQOGrqZxCz1ADfqUcWUyH9MdsIHGtkd5dksH3ZFslgZLolBxsQ8agrAzbSXUm
	S7BACEw/HawnHuGV2PMBvTcwS5Y2vWjARGr7HWb9bNF/pPRlw+cT0GNBtagjdT6AG3awAoMgaJJ
	Hm9j5C5E8T55BjN2Q/+1Jp4qK0RcgVM2puBUcqBYJ6ARALcgl9DY0bbJHTSocekhE=
X-Received: by 2002:a05:620a:4593:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-9479f2b00e0mr360762785a.23.1794305443552;
        Tue, 10 Nov 2026 02:10:43 -0800 (PST)
X-Received: by 2002:a05:620a:4593:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-9479f2b00e0mr360759185a.23.1794305442947;
        Tue, 10 Nov 2026 02:10:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm60806145e9.1.2026.11.10.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:10:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:10:40 +0100
Subject: [PATCH v2] gpio: shared: fix a race in shared desc release path
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
Message-Id: <20261110-gpio-shared-refcnt-race-v2-1-8a0b76e01714@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ/t8moC/4WNwQqDMBBEf0X23BU3oGJP/Y/iISZbXajGZlVax
 H9v6g/0MvBmmJkdlKOwwjXbIfImKmFKYC4ZuMFOPaP4xGAKUxEVFfazBNTBRvYY+eGmBaN1jKY
 j9p6d9Z2H1J5TKO9z+d4mHkSXED/n0UY/9//mRkhYN66hqi6L0na3oJq/Vvt0YRzzJNAex/EFr
 s61z8UAAAA=
X-Change-ID: 20261106-gpio-shared-refcnt-race-2b1eddecadbd
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QaT0N6QSxoOILYgCk8Ws3mmu+/8EWOZAz5V+a3NkPs0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8u2hE3WJd1FvW84yHPDr89QnOd63EJ+lkoK9c
 HqQ7Y/FeNuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavLtoQAKCRAFnS7L/zaE
 w4m5D/4j2EuA/eXow0PzPDW2JDYR7dCQHSbG74xkQ63GruYbpTgfDh5yckA+SlP9aWSBuSflU3r
 Wnb+3Qt3EWboR2T2swdDoH3lgx5I5X3okdYXBJ1ugtg/6Tb1UiT8/2wuskj+fYAqSgjZsjaam4G
 AZuGMg7fIegBiNS2m/x//sjaBV6KJVEgpbmmuHKzo9Pc5OTgkMc/CAe7moVQx+eCqvX+XdrdxGN
 /yns2LBWpsWqzQ70IgwP8DR/58Kfn0ieUC5TpqwV++8IGJFoOtMhLG7XH4GTAhCF05A6N5gCg0l
 tN1DO+zF+7xc9Q5oZ2rJdeaCl+wDrdepZmmULY6GwjIMzeo2J9GhU1ZnuwmES3j8G8GKJ3g9cYI
 ORwVPWbEoJQkOlnwPtHB8OY+bdyNkXrC/0LaGX7Trjy2ylktumF/hfmp2wsxZQdg5/1tGnLdu6L
 n9jpQikPPkUsEnY1dmwrtngxdEYdPEZ1A44gZd1EBuk55C42roO0NArco5q/Fmi2Vux/Bp89i8e
 0DItXq2cOIcC9/L7LYqt7WJ0DsvhU3F/rqryutsfy9S6zbe0k1p2LYqhPlCQvhHmZyDXU9P27he
 vOJG6krIKys0YZos1a2ATtjSqi+4iULf+pMYcjewC86JzO57jja6KWtqImghZgXviakWfOC1uD4
 +blPwa1FunQl3cQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sZEJb3KyH_FoFs-WDq0kbeoJrpIn0aE8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfXz/oy28ZlWiyj
 e+WUVxIJ43vtELbeyl8S3BV0WUVr9Ekd9uIxCenKGyzPIloKuU/duo1yRMUyDqoY/slEmDiIayH
 ahfiH39douBqRgAWMV67OKO/LUF1J6g=
X-Proofpoint-ORIG-GUID: sZEJb3KyH_FoFs-WDq0kbeoJrpIn0aE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfXx1UEEVUlRwnE
 T2ybO9bTi9YiZJKzziRMDxKe9aMyTVf0CkPc5l+ucfaPYJ9+fGQliPou6gVHxU3FA1tnz3uHFnT
 7aWl0FZZRQ1RSL4b6InyZYtHYy55qqmvvLriMyl1xeJYKlvFJn068Dak1LMT1MWrJr18iu1y5hv
 WTGhG0Lf9SjuyRNus7oOe10cu9IHIiuKCrwOERdXTUEOnBRq7MKZKz1WL7j4udjh5R7h6LOVHzy
 5P/AYBcfneyroxI2x7weVZOeVykf9GST98/J/Q2Wpn3w1LCyYLGWL3sfNpDgaJx/sCse5cfOs7s
 i6KyZ37C5uFzx60b13QRdSu8G3yfwkvY6cL7WNqymPU43VPrl7glA/T56omtJAD0Rc2cecBv3LP
 Zk+2wKv2fuIHNQYzrS9WZp8LloOVhFcOu8SmWrkwUYeVm9hRIAOzR19xhdtXMPkxksWxYHysfUX
 Pwud/2/ec5mehBpphhg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2eda4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=oU7bRusk_2LGITF8MfoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100040

gpiod_shared_put() races with concurrent calls to
devm_gpiod_shared_get() like so:

CPU 0 (unbind / probe failure)      CPU 1 (concurrent proxy probe)
==============================      ==============================
gpiod_shared_put()
  kref_put(&entry->ref, ...)
    refcount_dec_and_test() // -> 0
                                    devm_gpiod_shared_get()
                                      mutex_lock(&entry->lock);
                                      if (entry->shared_desc) {
                                        kref_get(&entry->ref); // on 0!
                                        shared_desc = entry->shared_desc;
                                      }
                                      mutex_unlock(&entry->lock);
    gpio_shared_release()
      mutex_lock(&entry->lock);
      kfree(shared_desc);
      entry->shared_desc = NULL;
      mutex_unlock(&entry->lock);
                                      // uses freed shared_desc

Because gpiod_shared_put() decrements entry->ref without holding
entry->lock and gpio_shared_release() only acquires entry->lock after the
reference count has already reached zero, a concurrent call to
devm_gpiod_shared_get() can acquire entry->lock in the intermediate window
and observe a non-NULL entry->shared_desc. This can result in a
use-after-free and a double-free when the second consumer releases its
reference.

Use kref_put_mutex() to ensure the entry lock is taken without a window
in which a concurrent user can see a non-NULL entry->shared_desc while
it's being released.

Cc: stable@vger.kernel.org
Closes: https://sashiko.dev/#/bug/linux-30e071e4-4e4a-4b63-bd83-df1147055d35
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- manually release the mutex acquired by kref_put_mutex() (sashiko)
- Link to v1: https://patch.msgid.link/20261106-gpio-shared-refcnt-race-v1-1-79c9167505ab@oss.qualcomm.com
---
 drivers/gpio/gpiolib-shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..edb04a5bb987e12faf96e5b70198a9fabf60ad0a 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -635,20 +635,20 @@ static void gpio_shared_release(struct kref *kref)
 		container_of(kref, struct gpio_shared_entry, ref);
 	struct gpio_shared_desc *shared_desc;
 
-	guard(mutex)(&entry->lock);
-
 	shared_desc = entry->shared_desc;
 	gpio_device_put(shared_desc->desc->gdev);
 	mutex_destroy(&shared_desc->mutex);
 	kfree(shared_desc);
 	entry->shared_desc = NULL;
+
+	mutex_unlock(&entry->lock);
 }
 
 static void gpiod_shared_put(void *data)
 {
 	struct gpio_shared_entry *entry = data;
 
-	kref_put(&entry->ref, gpio_shared_release);
+	kref_put_mutex(&entry->ref, gpio_shared_release, &entry->lock);
 }
 
 static struct gpio_shared_desc *

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-gpio-shared-refcnt-race-2b1eddecadbd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

