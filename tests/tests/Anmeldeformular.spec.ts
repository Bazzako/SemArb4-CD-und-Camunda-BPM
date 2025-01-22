import { test, expect } from '@playwright/test';

test('Anmeldeformular', async ({ page }) => {
  await page.goto('http://cloud-hf-14-w1:30000/camunda/app/welcome/default/#!/login');
  await page.getByPlaceholder('Username').fill('demo');
  await page.getByPlaceholder('Username').press('Tab');
  await page.getByPlaceholder('Password').fill('demo');
  await page.getByRole('button', { name: 'Log in' }).click();
  await page.locator('.tasklist-app > .app-label-wrapper').click();
  await page.getByRole('link', { name: ' Start process' }).click();
  await page.getByRole('link', { name: 'Garantiefallprozess' }).click();
  await page.reload();
  await page.getByRole('button', { name: 'Start' }).click();
  await page.getByRole('heading', { name: 'All Tasks' }).click();
  await page.locator('li').filter({ hasText: 'Gerätedaten erfassen Garantiefallprozess Created a few seconds ago' }).getByRole('link').click();
  await page.getByRole('button', { name: 'Claim' }).click();
  await page.getByLabel('DeviceModel Test').click();
  await page.getByLabel('DeviceModel Test').fill('Test1');
  await page.getByRole('button', { name: 'Complete' }).click();
});